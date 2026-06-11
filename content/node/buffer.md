---
title: Buffer
description: A Node.js object for working with binary data.
tags:
  - node
---

A **Buffer** stores raw binary data in Node.js.

Buffers appear when reading files, handling uploads, working with TCP sockets, decoding images, or converting text between encodings.

```js
const data = Buffer.from("hello", "utf8")
console.log(data.toString("hex"))
```

Most application code can work with strings or typed objects. Buffers matter when data is not naturally text, or when exact bytes are important.
