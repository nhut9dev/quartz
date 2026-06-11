---
title: Array.prototype.sort()
description: Sort an array in place, with an optional comparator.
tags:
  - javascript
  - array
  - array-method
---

`sort()` reorders an array **in place** and returns the same array. By default it compares elements as strings, which surprises people sorting numbers — `10` sorts before `2`.

```js
[10, 2, 1].sort() // [1, 10, 2] — string order!

[10, 2, 1].sort((a, b) => a - b) // [1, 2, 10]
```

The comparator decides order: return a negative number to put `a` first, positive to put `b` first, and `0` to leave them as-is.

Because it mutates, sorting shared data can surprise other code holding the same reference. To sort without touching the original, copy first with the spread operator, or use `toSorted`, which returns a new array — an [[immutable-operation|immutable]] alternative.

```js
const sorted = [...numbers].sort((a, b) => a - b)
```

Reach for the comparator whenever you sort anything but plain strings.
