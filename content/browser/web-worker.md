---
title: Web worker
description: A browser API for running JavaScript off the main thread.
tags:
  - browser
  - javascript
  - performance
---

A **web worker** runs JavaScript on a background thread so CPU-heavy work doesn't block the main UI thread.

## How it works

A worker is a separate thread with its own global scope and **no access to the DOM or `window`** — the main thread still owns the UI. The two communicate by passing messages: `postMessage` sends data, which is copied via structured clone. For large payloads you can avoid the copy by transferring ownership of a `Transferable` (like an `ArrayBuffer`) or sharing a `SharedArrayBuffer`.

```js
const worker = new Worker("parse.js")
worker.postMessage(bigFile)
worker.onmessage = (e) => render(e.data)
```

## When to use

Reach for a worker when computation would otherwise create a [[../frontend-performance/long-task|long task]] and freeze interaction: parsing, image processing, cryptography, search indexing, large data transforms. The same idea on the server is [[../node/worker-threads|worker threads]].

## Pitfalls

No DOM means a worker can't touch the page — it computes and hands results back for the main thread to render. Message serialization has a real cost, so passing huge objects can erase the benefit; transfer or share buffers instead. Workers have startup and memory overhead, so pool and reuse them rather than spawning per task. And they don't speed up I/O, which is already async on the main thread — workers are for *CPU* work.
