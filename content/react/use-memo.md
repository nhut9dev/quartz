---
title: useMemo
description: A React hook for memoizing an expensive calculated value.
tags:
  - react
  - hook
  - performance
---

`useMemo` memoizes a calculated value between renders. React recalculates the value only when one of its dependencies changes.

```jsx
const visibleUsers = useMemo(() => {
  return users.filter(user => user.active)
}, [users])
```

Use it for expensive calculations or for keeping object and array references stable when that stability matters.

Do not wrap every calculation in `useMemo`. Most calculations are cheap, and unnecessary memoization makes code harder to read. Start with clear rendering logic, then optimize measured bottlenecks.
