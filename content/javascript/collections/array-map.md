---
title: Array.prototype.map()
description: Creates a new array by transforming every element through a callback.
tags:
  - javascript
  - array
  - array-method
---

`map()` builds a **new array** by running every element of the source through a callback and collecting the results. It walks left to right, calls the callback once per element with `(item, index, array)`, and never touches the original — making it an [[immutable-operation|immutable operation]] that's safe for React state.

```js
const numbers = [1, 2, 3]

const doubled = numbers.map(n => n * 2) // [2, 4, 6]
// numbers is unchanged
```

The result always has the **same length** as the input, because `map` is about transformation, not selection. Reach for it when you want one output per input. When you want *fewer* items instead, use [[array-filter|filter()]]; when you want to collapse everything into a single value, use [[array-reduce|reduce()]].
