---
title: Redis
description: Notes about using Redis for caching, fast data structures, pub/sub, locks, and distributed coordination.
tags:
  - redis
  - index
---

**Redis** is an in-memory data store used for caching, fast data structures, pub/sub, rate limiting, locks, and lightweight coordination.

Redis is fast because it keeps working data in memory and offers purpose-built data structures. It is still an external dependency, so production use needs explicit decisions around [[redis-ttl|TTL]], [[redis-eviction|eviction]], [[redis-persistence|persistence]], and failure behavior.

## Core Concepts

- [[redis-data-structures|Redis data structures]]
- [[redis-cache|Redis cache]]
- [[redis-ttl|Redis TTL]]
- [[redis-eviction|Redis eviction]]
- [[redis-persistence|Redis persistence]]

## Patterns

- [[redis-pubsub|Redis Pub/Sub]]
- [[redis-distributed-lock|Redis distributed lock]]
- [[redis-rate-limiting|Redis rate limiting]]
- [[redis-cluster|Redis Cluster]]
