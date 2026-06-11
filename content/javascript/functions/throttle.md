---
title: Throttle
description: Limits a function so it can run at most once per time window.
tags:
  - javascript
  - function
  - performance
---

**Throttle** lets a function run at most once during a fixed time window. It is useful for scroll, pointer move, drag, and resize handlers where you want regular updates without letting the event rate overwhelm the page.

```js
function throttle(fn, delay) {
  let lastRun = 0

  return (...args) => {
    const now = Date.now()

    if (now - lastRun < delay) return

    lastRun = now
    fn(...args)
  }
}

const onScroll = throttle(() => {
  console.log(window.scrollY)
}, 100)
```

The returned function remembers `lastRun` through a [[closure|closure]]. Unlike [[debounce|debounce]], throttle does not wait for calls to stop; it allows a controlled stream of executions.
