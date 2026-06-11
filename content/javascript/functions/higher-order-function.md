---
title: Higher-order function
description: A function that receives another function or returns one.
tags:
  - javascript
  - function
---

A **higher-order function** works with other functions as values. It either accepts a function, returns a function, or does both.

```js
function withLogging(fn) {
  return (...args) => {
    console.log("calling")
    return fn(...args)
  }
}

const add = (a, b) => a + b
const loggedAdd = withLogging(add)
```

Array methods such as [[array-map|map()]], [[array-filter|filter()]], and [[array-reduce|reduce()]] are higher-order functions because they accept callbacks.

Higher-order functions are common in JavaScript because [[function|functions]] are values. They power composition, middleware, event handlers, and reusable behavior like [[debounce|debounce]] and [[throttle|throttle]].
