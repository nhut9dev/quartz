---
title: WeakMap and WeakSet
description: Object-keyed collections whose entries don't prevent garbage collection.
tags:
  - javascript
  - collection
---

A **WeakMap** and **WeakSet** hold object references *weakly*: if no other reference to a key object remains, the engine is free to garbage-collect it and drop the entry automatically. This avoids memory leaks when associating data with objects you don't own.

```js
const cache = new WeakMap()

let node = { id: 1 }
cache.set(node, "metadata")

node = null // entry becomes eligible for collection
```

Because entries can vanish at any time, these collections are deliberately limited: keys must be objects, and they are not iterable — no `size`, no `keys()`, no `for...of`.

That is the trade-off against [[map|Map]] and [[set|Set]], which keep their contents alive and let you enumerate them.

Use a WeakMap to attach private or cached data to objects without extending their lifetime.
