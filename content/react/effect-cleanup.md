---
title: Effect cleanup
description: A function returned from useEffect to undo the previous effect.
tags:
  - react
  - hook
  - effect
---

An **effect cleanup** is a function returned from [[use-effect|useEffect]]. React calls it before running the effect again and when the component unmounts.

```jsx
useEffect(() => {
  const id = setInterval(() => {
    console.log("tick")
  }, 1000)

  return () => clearInterval(id)
}, [])
```

Cleanups prevent old subscriptions, timers, listeners, or requests from staying alive after the UI no longer needs them.

If an effect creates or subscribes to something, it probably needs cleanup. If it only calculates data for render, it probably should not be an effect in the first place.
