---
title: Map
description: A key-value collection where keys can be any value.
tags:
  - javascript
  - collection
---

A **Map** stores key-value pairs like an [[object|object]], but its keys can be any value, not just strings or symbols.

```js
const map = new Map()

map.set("name", "Nhut")
map.set(1, "one")

map.get("name") // "Nhut"
map.get(1) // "one"
```

Maps are useful when keys are dynamic, when keys are objects, or when you need collection methods like `set`, `get`, `has`, `delete`, and `clear`.

```js
const visits = new Map()
const user = { id: 1 }

visits.set(user, 1)
```

For plain records that will become JSON, objects are usually simpler. For runtime lookup tables with arbitrary keys, `Map` is often clearer.
