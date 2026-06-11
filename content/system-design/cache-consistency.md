---
title: Cache consistency
description: Keeping cached data acceptably close to the source of truth.
tags:
  - system-design
  - caching
---

**Cache consistency** is the question of how fresh cached data must be compared with the source of truth.

Strong freshness often requires invalidation, write-through behavior, or short TTLs. Looser freshness can use longer TTLs, [[../caching/stale-while-revalidate|stale-while-revalidate]], and background refresh.

The right design depends on the user impact of stale data. A stale avatar is usually fine; a stale bank balance is not. Make the tolerance explicit before choosing [[../caching/cache-invalidation|cache invalidation]] or [[../caching/cache-ttl|cache TTL]] rules.
