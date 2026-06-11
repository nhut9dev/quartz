---
title: Effect dependency array
description: The list of values that decides when a useEffect runs again.
tags:
  - react
  - hook
  - effect
---

The **dependency array** is the second argument to [[use-effect|useEffect]]. It lists the values the effect reads from the component scope.

```jsx
useEffect(() => {
  document.title = title
}, [title])
```

When one dependency changes between renders, React runs the effect again. An empty array means the effect does not depend on changing component values.

```jsx
useEffect(() => {
  console.log("mounted")
}, [])
```

Do not remove dependencies just to stop an effect from running. That usually creates stale closures. Instead, change the code so the effect truly depends on fewer values, or move event-driven work into a [[react-event-handler|React event handler]].
