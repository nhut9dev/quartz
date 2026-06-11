---
title: Private state
description: State hidden behind a function or object API instead of exposed directly.
tags:
  - javascript
  - function
  - state
---

**Private state** is data that exists but cannot be accessed directly from the outside. JavaScript can create it with a [[closure|closure]], a [[private-field|private field]], or by keeping variables inside a module.

```js
function createCounter() {
  let count = 0

  return {
    next() {
      count += 1
      return count
    },
  }
}

const counter = createCounter()

counter.next() // 1
counter.count // undefined
```

The outside code can use the public methods, but it cannot freely read or overwrite `count`. This keeps invariants in one place: validation, normalization, and update rules stay inside the API that owns the state.
