---
title: Array.prototype.filter()
description: Creates a new array with only the elements that pass a test.
tags:
  - javascript
  - array
  - array-method
---

`filter()` builds a **new array** containing only the elements that pass a test. It walks the source left to right, calls your predicate with `(item, index, array)`, and keeps each element whose return value is truthy — leaving the original array untouched.

```js
const numbers = [1, 2, 3, 4, 5]

const even = numbers.filter(n => n % 2 === 0) // [2, 4]
```

Unlike [[array-map|map()]], the result can be **shorter** than the input, or even empty when nothing matches — but it's always a real array, never `undefined`. Use `filter` when you want a subset, `map` when you want to transform every item, or [[array-reduce|reduce()]] when you want to fold the list into a single value. Because it returns a fresh array, it's an [[immutable-operation|immutable operation]].
