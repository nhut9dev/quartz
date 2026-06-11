---
title: Route
description: A mapping between a URL pattern and UI.
tags:
  - react
  - routing
---

A **route** maps a URL pattern to UI. For example, `/users` might show a user list, while `/users/:id` might show one user's detail page.

Routes let the URL become part of application state. Users can refresh, bookmark, share links, and navigate with the browser back button.

React does not include routing by default. Common choices are [[react-router|React Router]], [[tanstack-router|TanStack Router]], or framework routers from Next.js and TanStack Start.

```txt
/                  HomePage
/users             UserListPage
/users/:userId     UserDetailPage
/settings/profile  ProfileSettingsPage
```

A route can have static segments, dynamic params, search params, and nested layouts. Dynamic params such as `:userId` become input for loading detail data, often through a data library like [[../data-fetching/tanstack-query|TanStack Query]].

Good routes describe user-facing locations, not implementation details. A URL should stay meaningful even if the component tree behind it changes.
