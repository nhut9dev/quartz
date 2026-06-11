---
title: Call stack
description: The stack of functions currently being executed by JavaScript.
tags:
  - javascript
  - runtime
---

The **call stack** is where JavaScript tracks the functions currently running. When a function is called, a frame is pushed onto the stack. When it returns or throws, that frame is popped off.

```js
function first() {
  second()
}

function second() {
  third()
}

function third() {
  console.log("done")
}

first()
```

While `third` runs, the stack contains `first`, `second`, and `third`. JavaScript finishes the top frame before going back down.

Async callbacks do not appear on the stack until the [[event-loop|event loop]] schedules them. This is why `await` can pause a function and let other work run before the function resumes.
