---
title: Array.prototype.find()
description: Return the first element that matches a test, or undefined.
tags:
  - javascript
  - array
  - array-method
---

`find()` returns the **first element** for which your predicate returns truthy, then stops walking the array. If nothing matches, it returns `undefined`.

```js
const users = [
  { id: 1, name: "An" },
  { id: 2, name: "Nhut" },
]

users.find(u => u.id === 2) // { id: 2, name: "Nhut" }
users.find(u => u.id === 9) // undefined
```

This is the key contrast with [[array-filter|filter()]]: `filter` collects *every* match into a new array, while `find` short-circuits and hands back a single element. When you only want one item, `find` is both clearer and faster because it stops early.

If you need the position instead of the value, use `findIndex`, which returns the matching index or `-1`.

Use `find` when you expect a single result and want the element itself.
