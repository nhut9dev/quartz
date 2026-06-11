---
title: TanStack Router
description: A type-safe routing library for React applications.
tags:
  - react
  - tanstack
  - routing
  - library
---

**TanStack Router** is a type-safe router for React. It focuses on typed route params, search params, loaders, and route structure.

```tsx
export const Route = createFileRoute("/users/$userId")({
  component: UserPage,
})
```

It pairs naturally with [[../data-fetching/tanstack-query|TanStack Query]] because both libraries model app data around explicit keys and route-driven inputs.

Use it when route correctness and TypeScript integration matter more than choosing the most widely used router.

Related notes: [[type-safe-routing|Type-safe routing]], [[route-params|Route params]], and [[../data-fetching/query-key|Query key]].
