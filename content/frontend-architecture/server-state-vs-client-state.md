---
title: Server state vs client state
description: Distinguishing remote application data from local interface state.
tags:
  - frontend-architecture
  - react
---

**Server state** is data owned by a backend, such as users, orders, permissions, and search results.

**Client state** is local interface state, such as selected tabs, open dialogs, draft inputs, and temporary filters.

Mixing them makes caching, invalidation, loading states, and updates harder to reason about.

Libraries such as [[../react/data-fetching/tanstack-query|TanStack Query]] are designed for server state, while local React state is often enough for client state.
