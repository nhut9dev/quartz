---
title: Server state
description: Data owned by a server but displayed and cached by the client.
tags:
  - react
  - data-fetching
  - state
---

**Server state** is data owned by a backend or external source. The client displays it, caches it, refetches it, and sends mutations, but it is not the source of truth.

Examples include users, posts, invoices, notifications, permissions, and search results loaded from an API.

Server state is different from client [[state|state]]. Client state belongs to the UI; server state belongs to the server and needs cache rules, invalidation, loading states, and error handling.

Libraries like [[tanstack-query|TanStack Query]] help manage server state without turning every API response into global client state.
