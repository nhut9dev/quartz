---
title: Cache stampede
description: A failure mode where many requests rebuild the same expired cache value at once.
tags:
  - caching
  - performance
---

A **cache stampede** (or "thundering herd") happens when a popular cached value expires and many in-flight requests all miss at once, so they all recompute it simultaneously — turning the cache from a shield into an amplifier of load on the origin.

## How it happens

The cache's whole job is to absorb reads so only a trickle reaches the backend. But expiry is an instant, not a gradient: the moment a hot key's [[cache-ttl|TTL]] lapses, every concurrent request for it gets a miss. If 1,000 requests/sec were being served from one cached entry, they now *all* fall through to the database in the same window and recompute the identical value. The backend, sized for the cached trickle, gets the full firehose — often enough to take it down, which keeps the key from ever repopulating, sustaining the outage.

## Defenses

- **Request coalescing / locking** — let only the first miss recompute; other requests wait for its result instead of duplicating the work. (Also called single-flight.)
- **Serve stale while revalidating** — return the just-expired value and refresh in the background, so no request blocks on a cold miss. See [[stale-while-revalidate|stale-while-revalidate]].
- **TTL jitter** — add randomness to expiry times so keys that were populated together don't all expire together, spreading misses out.
- **Background refresh / [[cache-warming|warming]]** — recompute hot keys before they expire, so the cache is never cold under load.

## Pitfalls

A single global lock per key fixes the stampede but serializes all waiters, so a slow recompute makes every request wait on it — the lock needs a timeout and a fallback. Jitter helps independent keys but does nothing for a single hyper-hot key; that one needs coalescing or stale-serving. This problem shows up the same way across [[redis|Redis]], [[cdn-cache|CDN caches]], and expensive database-backed pages — anywhere one expensive value is shared by many readers.
