---
title: Mutation
description: A server write operation such as create, update, or delete.
tags:
  - react
  - tanstack
  - data-fetching
---

A **mutation** changes server data: create, update, delete, submit, upload, or trigger an action.

```jsx
const mutation = useMutation({
  mutationFn: createPost,
  onSuccess: () => {
    queryClient.invalidateQueries({ queryKey: ["posts"] })
  },
})
```

In [[tanstack-query|TanStack Query]], mutations are separate from queries because writes have different lifecycle needs: pending state, errors, retries, optimistic updates, and cache invalidation.
