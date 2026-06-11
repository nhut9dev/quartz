---
title: Array.prototype.reduce()
description: Collapses an array into a single accumulated value.
tags:
  - javascript
  - array
  - array-method
---

`reduce()` walks an array from left to right and carries an **accumulator** through every element. Each callback return value becomes the accumulator for the next step, so the whole array can be folded into one final result.

```js
const numbers = [1, 2, 3, 4]

const total = numbers.reduce((sum, n) => sum + n, 0) // 10
```

The second argument, `0` above, is the initial accumulator. Prefer passing it explicitly; without an initial value, JavaScript uses the first array element as the starting accumulator, which can make empty arrays throw a `TypeError`.

Use [[array-map|map()]] when you want one output per input, [[array-filter|filter()]] when you want fewer items, and `reduce()` when the output is a different shape: a number, object, map, grouped collection, or any value built step by step.
