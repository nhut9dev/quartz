---
title: Set
description: A collection that stores unique values.
tags:
  - javascript
  - collection
---

A **Set** stores unique values. Adding the same value more than once keeps only one copy.

```js
const ids = [1, 2, 2, 3, 3, 4]
const uniqueIds = [...new Set(ids)]

uniqueIds // [1, 2, 3, 4]
```

Sets are useful for de-duplicating arrays and for quick membership checks with `has`.

```js
const selected = new Set(["read", "write"])

selected.has("read") // true
selected.has("admin") // false
```

Use an [[array|array]] when order and duplicates matter. Use a `Set` when uniqueness is the main rule.
