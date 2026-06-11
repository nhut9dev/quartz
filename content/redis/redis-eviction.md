---
title: Redis eviction
description: How Redis removes keys when memory is full.
tags:
  - redis
  - memory
---

**Redis eviction** is how Redis removes keys when memory is full.

Eviction is controlled by `maxmemory` and an eviction policy such as LRU-like, LFU-like, TTL-based, random, or no eviction. It is different from [[redis-ttl|TTL]] expiry: TTL removes keys because time passed; eviction removes keys because Redis needs memory.

Use eviction policies only when losing keys is acceptable, such as cache workloads. For durable queues, locks, or critical state, memory pressure should be treated as an incident.

The pitfall is mixing critical data and disposable cache keys in the same Redis without understanding which keys can be evicted.
