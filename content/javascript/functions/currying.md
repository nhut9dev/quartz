---
title: Currying
description: Transforming a multi-argument function into a chain of single-argument functions.
tags:
  - javascript
  - function
---

**Currying** rewrites a function that takes several arguments as a chain of functions that each take one. Calling the chain partway returns a new function waiting for the rest, which enables *partial application*.

```js
const add = a => b => c => a + b + c

add(1)(2)(3) // 6

const addTen = add(10)
addTen(5)(1) // 16
```

Each step is a [[higher-order-function|higher-order function]] that returns another function, and each captures the earlier arguments through a [[closure|closure]]. That captured state is what lets `addTen` remember `10`.

Currying shines when you want to pre-fill some arguments and reuse the result — for example building specialized handlers or composing small, focused functions.

Use it when fixing a few arguments up front makes a function more reusable; reach for plain multi-arg calls when you always have every value at once.
