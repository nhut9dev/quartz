---
title: Redis cache
description: Using Redis as a fast temporary store for data that can be recomputed or refetched.
tags:
  - redis
  - caching
---

**Redis cache** is using Redis as a fast temporary store for data that can be recomputed or refetched.

### How it works

The application checks Redis before doing slower work such as a database query, API call, or expensive computation. On a miss, it loads the source of truth, stores the result with a [[redis-ttl|TTL]], and returns it.

Redis cache design depends on key naming, serialization, invalidation, TTL, and fallback behavior. It connects to [[../caching/cache-aside|cache-aside]], [[../caching/cache-invalidation|cache invalidation]], and [[../caching/cache-stampede|cache stampede]].

### When to use

Use Redis cache for frequently read data, expensive calculations, session-adjacent lookups, rate limit counters, and shared results across app instances.

### Trade-offs

Caching reduces latency and load, but it introduces staleness and failure modes. The source of truth must remain clear, and the app should handle Redis timeouts without taking down the whole request path.

### Pitfalls

Avoid caching without TTL, using unbounded keys, caching personalized data under shared keys, and assuming Redis is always faster when network latency or serialization dominates.
