---
title: Cache consistency
description: Keeping cached data acceptably close to the source of truth.
tags:
  - system-design
  - caching
---

**Cache consistency** is the question of how fresh cached data must be relative to its source of truth — and, crucially, how much staleness each use of the data can tolerate.

## The freshness spectrum

There's no single right answer, only a trade between freshness and the cost of providing it:

- **Strong freshness** — invalidate or [[../caching/write-through|write through]] on every change, or use very short [[../caching/cache-ttl|TTLs]]. The cache rarely lies, but you pay in write-path complexity, more origin load, and lower hit rates.
- **Bounded staleness** — a moderate TTL: data can be up to N seconds old, accepted as a deliberate ceiling.
- **Loose freshness** — long TTLs plus [[../caching/stale-while-revalidate|stale-while-revalidate]] and background refresh. Best performance and hit rate, weakest guarantees.

## Choosing the tolerance

The right point on the spectrum is set by the *user impact of stale data*, not by the cache technology. A stale avatar or view count is invisible; a stale price, account balance, or permission is a bug or a security hole. So the design starts from a product question — "what breaks if this is 30 seconds old?" — and only then picks the [[../caching/cache-invalidation|invalidation]] and [[../caching/cache-ttl|TTL]] mechanism that enforces the answer.

## Pitfalls

The common failure is leaving the tolerance *implicit*: a default TTL gets applied uniformly, and nobody notices it's wrong for the one field where staleness matters until a customer sees an old balance. Different data on the same page often needs different policies, so a single cache-wide setting is usually wrong somewhere. And caching data whose correct staleness tolerance is "zero" (live permissions, money) is a category error — that data shouldn't be cached behind a TTL at all, or must be invalidated synchronously on change.
