---
title: Query key
description: The stable identity TanStack Query uses for cached data.
tags:
  - react
  - tanstack
  - data-fetching
---

A **query key** identifies cached data in [[tanstack-query|TanStack Query]]. It should include every value that changes what data is fetched.

```jsx
useQuery({
  queryKey: ["user", userId],
  queryFn: () => fetchUser(userId),
})
```

If the `userId` changes, the query key changes, so TanStack Query treats it as different data.

Good query keys are stable, structured, and specific. Avoid hiding important fetch inputs only inside the query function.
