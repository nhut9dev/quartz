---
title: Redis rate limiting
description: Using Redis counters or sorted sets to enforce request quotas across multiple app instances.
tags:
  - redis
  - rate-limiting
---

**Redis rate limiting** is using Redis counters or sorted sets to enforce request quotas across multiple app instances.

Redis is common for distributed rate limiting because all app instances can update the same keys atomically. Fixed windows use counters with [[redis-ttl|TTL]], sliding windows often use sorted sets, and token buckets track refill state.

Use it when local in-memory limits are not accurate enough across a fleet. It connects to [[../system-design/rate-limiter|rate limiter]] design.

The pitfall is making Redis a hard dependency for every request without a failure policy. Decide whether to fail open, fail closed, or use local fallback when Redis is slow.
