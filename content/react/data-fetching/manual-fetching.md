---
title: Manual fetching
description: Fetching data with useEffect and local state in React.
tags:
  - react
  - data-fetching
---

**Manual fetching** usually means calling `fetch` inside [[use-effect|useEffect]] and storing loading, data, and error values in local state.

```jsx
function UserPage({ userId }) {
  const [user, setUser] = useState(null)

  useEffect(() => {
    let ignore = false

    fetch(`/api/users/${userId}`)
      .then(response => response.json())
      .then(data => {
        if (!ignore) setUser(data)
      })

    return () => {
      ignore = true
    }
  }, [userId])
}
```

This is fine for small cases, but it gets repetitive once you need caching, retries, refetching, deduping, pagination, or mutation invalidation. For that, use [[tanstack-query|TanStack Query]] or another data fetching library.
