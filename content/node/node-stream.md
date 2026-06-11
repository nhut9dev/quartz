---
title: Node stream
description: A Node.js abstraction for reading or writing data in chunks.
tags:
  - node
---

A **Node stream** reads or writes data in chunks instead of loading everything into memory at once. That makes it the right tool for large files, uploads, downloads, compression, and network responses, since a program can start processing data before all of it has arrived.

## Types and piping

There are four kinds: **readable** (a source), **writable** (a sink), **duplex** (both), and **transform** (a duplex that modifies data passing through, like gzip). You connect them with `pipe()` or, better, `pipeline()`, which chains a source through transforms into a sink.

```js
import { pipeline } from "node:stream/promises"
await pipeline(fs.createReadStream("in"), createGzip(), fs.createWriteStream("out.gz"))
```

## Backpressure

The key mechanism is backpressure. A writable stream's `write()` returns `false` when its internal buffer is full; a well-behaved producer then pauses until the `drain` event. `pipe`/`pipeline` handle this automatically, matching a fast source to a slow destination so memory stays bounded.

## Pitfalls

Ignoring backpressure in manual `write()` loops — pushing data faster than the consumer drains it — blows up memory. An unhandled `'error'` event throws and can crash the process, and a raw `pipe()` does *not* forward errors or clean up, which is why `pipeline()` (with its callback/promise) is the safer default. Don't mix paused and flowing modes on the same stream; pick one consumption style.
