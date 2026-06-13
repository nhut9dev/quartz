---
title: Cache-aside
description: A caching pattern where application code loads and updates the cache around the database.
tags:
  - caching
---

**Cache-aside** (lazy loading) is a [[caching|caching]] pattern where the application checks the cache first, loads from the database on a miss, then stores the result in the cache for next time.

It is the most common caching pattern for read-heavy data, and the one most caches default to.

## How it works

The cache sits *beside* the data store, not in the write path. On a read, the application: looks up the key in the cache; on a hit, returns it; on a miss, reads the database, writes the value into the cache, and returns it. The cache fills lazily — only keys that are actually requested ever get cached, so the working set naturally reflects real demand.

Writes are the application's responsibility. When source data changes, the code must [[cache-invalidation|invalidate]] (usually *delete*) the affected key so the next read re-populates it from the database.

## When to use

It fits read-heavy workloads where stale reads are tolerable for at most a [[cache-ttl|TTL]], and where the cache going down should degrade performance but not correctness — on a cache outage, reads simply fall through to the database. It's also resilient to the cache and database having different shapes, since the app does the mapping.

## Pitfalls

The classic bug is the **read/write race**: a reader gets a miss and fetches the old value from the DB; concurrently a writer updates the DB and deletes the (empty) key; then the slow reader writes its now-stale value into the cache, where it sticks until TTL. Mitigations are short TTLs as a backstop, or more careful write-time invalidation.

Prefer **delete-on-write over update-on-write**: deleting lets the next read repopulate correctly, while writing the new value into the cache directly reintroduces the same race. And a cold or cleared cache means every read misses at once — see [[cache-stampede|cache stampede]] and [[cache-warming|cache warming]].
