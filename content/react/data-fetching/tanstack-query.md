---
title: TanStack Query
description: A React library for fetching, caching, synchronizing, and mutating server state.
tags:
  - react
  - tanstack
  - data-fetching
  - library
---

**TanStack Query** manages [[server-state|server state]]: fetching, caching, loading states, errors, retries, background refetching, and mutation invalidation.

```jsx
function UserPage({ userId }) {
  const query = useQuery({
    queryKey: ["user", userId],
    queryFn: () => fetch(`/api/users/${userId}`).then(res => res.json()),
  })

  if (query.isLoading) return <p>Loading...</p>
  if (query.isError) return <p>Failed to load user</p>

  return <h1>{query.data.name}</h1>
}
```

Use TanStack Query for API data. Use [[../state-management/zustand|Zustand]] or local React state for client-only UI state.
