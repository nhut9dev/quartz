---
title: Debounce
description: Delays a function until calls have stopped for a chosen amount of time.
tags:
  - javascript
  - function
  - performance
---

**Debounce** waits until repeated calls stop, then runs the function once. It is useful for input search, resize handlers, validation, and other events that can fire many times while the user is still doing something.

```js
function debounce(fn, delay) {
  let timeoutId

  return (...args) => {
    clearTimeout(timeoutId)

    timeoutId = setTimeout(() => {
      fn(...args)
    }, delay)
  }
}

const search = debounce(query => {
  console.log("searching", query)
}, 300)
```

The returned function keeps `timeoutId` alive through a [[closure|closure]]. Every call resets the timer. Only the final call wins after the delay passes. Use [[throttle|throttle]] instead when you want steady updates at a limited rate.
