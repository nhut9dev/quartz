---
title: SWR
description: A React data fetching library focused on caching and revalidation.
tags:
  - react
  - data-fetching
  - library
---

**SWR** is a React data fetching library built around stale-while-revalidate caching. It returns cached data quickly, then revalidates in the background.

```jsx
function Profile() {
  const { data, error, isLoading } = useSWR("/api/user", fetcher)

  if (isLoading) return <p>Loading...</p>
  if (error) return <p>Failed</p>

  return <h1>{data.name}</h1>
}
```

SWR is simple and effective for many read-heavy views. [[tanstack-query|TanStack Query]] gives more explicit tools for mutations, invalidation, and complex server-state workflows.
