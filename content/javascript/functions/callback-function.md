---
title: Callback function
description: A function passed into another function to be called later.
tags:
  - javascript
  - function
---

A **callback** is a function passed into another function. The receiving function decides when to call it.

```js
const numbers = [1, 2, 3]

const doubled = numbers.map(n => n * 2)
```

Here `n => n * 2` is a callback. [[array-map|map()]] calls it once for every item and uses the returned value to build a new array.

Callbacks show up in array methods, event listeners, timers, promises, and async workflows.

```js
button.addEventListener("click", () => {
  console.log("clicked")
})
```

Because callbacks are functions, they can also close over surrounding variables through [[closure|closures]].
