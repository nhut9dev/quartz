---
title: Cache stampede
description: A failure mode where many requests rebuild the same expired cache value at once.
tags:
  - caching
  - performance
---

A **cache stampede** happens when a popular cached value expires and many requests recompute it at the same time.

Instead of protecting the backend, the cache creates a sudden spike of work.

Common defenses include request coalescing, locks, jittered [[cache-ttl|TTLs]], background refresh, and serving stale data while one process rebuilds the value.

This problem is common with [[redis|Redis]], CDN caches, and expensive database-backed pages.
