---
title: Immutable operation
description: An operation that returns a new value instead of changing the original.
tags:
  - javascript
  - data
  - immutability
---

An **immutable operation** leaves the original value alone and returns a new value with the change applied. This is easy to see with array methods like [[array-map|map()]], [[array-filter|filter()]], and [[array-reduce|reduce()]]: they produce results without rewriting the source array.

```js
const numbers = [1, 2, 3]

const doubled = numbers.map(n => n * 2)

numbers // [1, 2, 3]
doubled // [2, 4, 6]
```

Immutability makes changes easier to reason about because old values stay valid. It matters a lot in UI code: React state updates should usually create fresh arrays or objects so React can detect that something changed.

```js
const users = [{ id: 1, name: "An" }]

const nextUsers = [...users, { id: 2, name: "Binh" }]
```

Immutable does not mean deeply frozen. If an array contains objects, the array can be new while the objects inside are still shared references.
