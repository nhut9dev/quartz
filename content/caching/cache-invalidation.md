---
title: Cache invalidation
description: Deciding when cached data should be removed or refreshed.
tags:
  - caching
---

**Cache invalidation** is the process of making stale [[caching|cached]] data stop being served — the famously hard half of caching, because a cache is only useful if you can also trust it not to lie.

## Approaches

There's a spectrum from "expire eventually" to "expire exactly when the source changes":

- **TTL expiry** — every entry has a [[cache-ttl|time-to-live]]; it's simply dropped when it ages out. Trivial to implement, but data is stale for up to the full TTL.
- **Explicit deletion** — the write path deletes affected keys when source data changes. Precise, but only as correct as your ability to enumerate every key a change touches.
- **Versioned keys** — bake a version or content hash into the [[cache-key|key]] (`user:42:v7`); a change bumps the version, so old entries are never read again and age out naturally. No deletion needed, but old entries linger until evicted.
- **Event-based** — a change emits an event and subscribers invalidate their copies. Scales to [[multi-layer-cache|many layers]], but adds messaging and lag.
- **Background refresh** — keep serving the old value while asynchronously recomputing it, as in [[stale-while-revalidate|stale-while-revalidate]].

## Why it's hard

The difficulty isn't deleting one key — it's knowing *which* keys a change affects. One database update can invalidate many derived, denormalized, or aggregated cache entries across several layers, and missing any one of them serves stale data indefinitely. Invalidate too eagerly and you destroy the hit rate the cache existed for; too lazily and you serve wrong answers. There's no setting that's right for both.

## Pitfalls

Stale data is *correct enough* for some flows (a slightly old view count) and dangerous for others (an old price, a revoked permission) — the same TTL can't be right for both, so invalidation policy has to be decided per data type, not globally. Versioned keys avoid races but leak memory until eviction. And explicit deletion that runs *before* the database commits opens a window where a concurrent read repopulates the stale value — invalidate after the write is durable.
