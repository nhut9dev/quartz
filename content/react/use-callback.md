---
title: useCallback
description: A React hook for memoizing a function reference.
tags:
  - react
  - hook
  - performance
---

`useCallback` memoizes a function reference between renders. It is similar to [[use-memo|useMemo]], but specifically for functions.

```jsx
const handleSelect = useCallback(id => {
  setSelectedId(id)
}, [])
```

Use it when a stable function reference matters: passing callbacks to a [[react-memo|memoized]] child, subscribing and unsubscribing in an effect, or avoiding unnecessary recalculation in another hook.

It does not make the function itself faster. It only helps preserve identity across renders when dependencies have not changed.
