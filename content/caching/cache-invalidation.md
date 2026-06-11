---
title: Cache invalidation
description: Deciding when cached data should be removed or refreshed.
tags:
  - caching
---

**Cache invalidation** is the process of making stale [[caching|cached]] data stop being used.

Common approaches include time-to-live, explicit deletion, versioned keys, event-based invalidation, and background refresh as in [[stale-while-revalidate|stale-while-revalidate]].

Invalidation is difficult because stale data can be correct enough for some flows and dangerous for others.
