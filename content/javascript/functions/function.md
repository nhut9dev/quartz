---
title: Function
description: A reusable block of code that can receive input and return output.
tags:
  - javascript
  - function
---

A **function** packages code so it can be called later. It can receive parameters, use arguments, and return a value.

```js
function add(a, b) {
  return a + b
}

add(2, 3) // 5
```

Functions are values in JavaScript. You can store them in variables, pass them into other functions, and return them from functions.

```js
const double = n => n * 2

function run(fn, value) {
  return fn(value)
}

run(double, 4) // 8
```

That value-like behavior is the foundation for [[callback-function|callbacks]], [[higher-order-function|higher-order functions]], and [[closure|closures]].
