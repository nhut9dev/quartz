---
title: React Router
description: A popular routing library for React applications.
tags:
  - react
  - routing
  - library
---

**React Router** is a popular routing library for React. It maps URLs to components and supports nested routes, loaders, actions, navigation, and route params.

```jsx
createBrowserRouter([
  {
    path: "/",
    element: <RootLayout />,
    children: [
      { path: "users/:userId", element: <UserPage /> },
    ],
  },
])
```

Use React Router when you want a mature general-purpose client router. Consider [[tanstack-router|TanStack Router]] when type-safe routing is a priority.
