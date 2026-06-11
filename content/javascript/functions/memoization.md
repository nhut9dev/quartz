---
title: Memoization
description: Caching function results so repeated calls can reuse previous work.
tags:
  - javascript
  - function
  - performance
---

**Memoization** stores the result of a function call and reuses it when the same input appears again. It is a small cache wrapped around a function, often implemented with a [[closure|closure]].

```js
function memoize(fn) {
  const cache = new Map()

  return value => {
    if (cache.has(value)) return cache.get(value)

    const result = fn(value)
    cache.set(value, result)
    return result
  }
}

const square = memoize(n => n * n)
```

Memoization is useful for expensive, pure calculations: same input, same output, no hidden side effects. It is less useful for cheap work, changing data, or functions that depend on time, network, randomness, or mutable external state.
