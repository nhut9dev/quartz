---
title: Microtask queue
description: The queue used for promise continuations and other high-priority async callbacks.
tags:
  - javascript
  - runtime
  - async
---

The **microtask queue** holds callbacks that should run right after the current synchronous work finishes. Promise `.then()`, `.catch()`, `.finally()`, and resumed `await` code use microtasks.

```js
console.log("A")

Promise.resolve().then(() => console.log("B"))

console.log("C")
```

This logs `A`, `C`, then `B`. The promise callback waits until the current [[call-stack|call stack]] is empty.

The [[event-loop|event loop]] drains microtasks before moving on to many other queued tasks. That makes microtasks useful for promise coordination, but too many chained microtasks can delay rendering or user-event handling.
