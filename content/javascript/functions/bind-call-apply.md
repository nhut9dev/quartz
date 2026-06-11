---
title: bind, call, and apply
description: Methods that control what this refers to when calling a function.
tags:
  - javascript
  - function
---

`call`, `apply`, and `bind` let you set [[this|this]] explicitly for a [[function|function]], rather than relying on the call site. `call` and `apply` invoke the function immediately; `bind` returns a new function with `this` permanently fixed.

```js
function greet(greeting) {
  return `${greeting}, ${this.name}`
}

const user = { name: "Nhut" }

greet.call(user, "Hi") // "Hi, Nhut"
greet.apply(user, ["Hi"]) // same, args as array
const bound = greet.bind(user)
bound("Hey") // "Hey, Nhut"
```

The only difference between `call` and `apply` is how arguments arrive: `call` takes them one by one, `apply` takes them as an array. `bind` is for later — it produces a reusable function whose receiver is locked in.

Use `bind` to hand a method to a callback without losing its `this`; use `call`/`apply` to borrow a method for another object.
