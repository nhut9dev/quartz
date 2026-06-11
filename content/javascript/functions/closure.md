---
title: Closure
description: A function bundled with references to its surrounding lexical scope.
tags:
  - javascript
  - function
---

A **closure** is what you get when a function keeps a reference to the variables around it, even after the scope that created those variables has finished running. The function carries its birthplace with it: wherever it travels, it can still read and update the variables it was defined alongside.

```js
function createCounter() {
  let count = 0 // private — only the returned function can see it

  return () => ++count
}

const next = createCounter()
next() // 1
next() // 2
```

## How it works

This falls out of [[lexical-scope|lexical scope]]. When a function is created, JavaScript captures a reference to the variable environment it was born in — not a copy of the values, but the live bindings. As long as the function stays reachable, those bindings stay alive instead of being garbage-collected. Each call to `createCounter` produces a fresh, independent `count` that nothing outside can touch.

## What it's used for

Closures are the mechanism behind [[private-state|private state]], [[memoization|memoization]], [[debounce|debounce]] and [[throttle|throttle]], event handlers that remember setup data, and the way React hooks recall values between renders.

## Pitfalls

Because closures capture *bindings*, not snapshots, a closure created in a `var` loop sees the loop's final value — every callback shares one binding. Block-scoped `let` fixes it by creating a fresh binding per iteration. The same capturing causes **stale closures** in React: an effect or handler keeps seeing an old render's values unless dependencies are declared. And a long-lived closure keeps everything it captured alive, so capturing a large object you no longer need is a quiet memory leak.
