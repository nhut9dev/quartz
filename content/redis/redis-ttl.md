---
title: Redis TTL
description: The expiration time after which Redis automatically removes a key.
tags:
  - redis
  - caching
---

**Redis TTL** is the expiration time after which Redis automatically removes a key.

TTL limits staleness and prevents temporary keys from growing forever. It is essential for [[redis-cache|Redis cache]], sessions, rate limit counters, locks, and deduplication keys.

Choose TTL based on how stale the data may be, how expensive recomputation is, and how much traffic a synchronized expiry could create.

The common failure is using the same TTL for many hot keys, causing a burst of misses at once. Add jitter when many keys are created together.
