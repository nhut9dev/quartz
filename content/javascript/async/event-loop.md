---
title: Event loop
description: The runtime mechanism that schedules JavaScript work over time.
tags:
  - javascript
  - runtime
  - async
---

The **event loop** is the runtime mechanism that lets JavaScript handle asynchronous work while still executing one piece of JavaScript at a time.

## How it works

JavaScript runs synchronous code on the [[call-stack|call stack]] to completion — a task never gets interrupted partway, which is called *run-to-completion*. Only when the stack is empty does the event loop pick up pending work. It drains the entire [[microtask-queue|microtask queue]] first, then takes **one** macrotask (a timer callback, I/O, or user event), then drains microtasks again, and repeats. In the browser, rendering happens between these turns.

## Microtasks vs macrotasks

Promise continuations and `queueMicrotask` go on the microtask queue; `setTimeout`, I/O, and DOM events go on the macrotask queue. Because all microtasks are flushed before the next macrotask, a resolved promise's callback runs before a `setTimeout(..., 0)` queued earlier — a common source of "why did this log first?" confusion.

```js
setTimeout(() => console.log("timeout"), 0)
Promise.resolve().then(() => console.log("promise"))
// promise, then timeout
```

## Pitfalls

The single thread is shared with rendering, so a long synchronous task (a heavy loop, a huge JSON parse) freezes the UI — break it up or move it to a [[../browser/web-worker|web worker]]. A microtask that schedules another microtask forever starves macrotasks and rendering entirely. And `setTimeout(fn, 0)` is not really zero: it waits for the current task plus the timer's minimum delay. The loop itself is not JavaScript syntax — it's provided by the [[javascript-runtime|runtime]], a browser or [[node-runtime|Node.js]].
