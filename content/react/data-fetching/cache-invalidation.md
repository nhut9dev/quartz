---
title: Cache invalidation
description: Keeping cached server state correct after mutations, background refreshes, and cross-view changes.
tags:
  - react
  - data-fetching
  - cache
---

**Cache invalidation** decides when cached server state is no longer trustworthy and should be refetched, updated, or removed.

In React apps, invalidation is usually more important than the initial fetch. Users move across screens, mutate records, and expect every visible view to reflect the same backend truth.

## Strategies

Invalidate by query key after a mutation when the affected data is broad or hard to update precisely. Update the cache directly when the mutation response contains enough fresh data and the affected query shape is known.

Use stale time for data that can safely age for a short period. Use refetch-on-focus or background refresh for data that changes outside the current tab.

## Scope

Good query keys make invalidation predictable. Include stable identity such as tenant, filters, pagination cursor, and resource ID when they change the result.

## Pitfalls

Over-invalidating causes unnecessary loading and network traffic. Under-invalidating shows stale or contradictory UI. Optimistic updates need rollback behavior when the server rejects the mutation.

Related notes: [[query-key|Query key]], [[mutation|Mutation]], [[tanstack-query|TanStack Query]], [[../../product-engineering/optimistic-ui|Optimistic UI]], and [[../../caching/cache-invalidation|Cache invalidation]].
