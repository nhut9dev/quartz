---
title: Eviction policy
description: How a full cache decides which entries to drop to make room for new ones.
tags:
  - caching
---

An **eviction policy** is the rule a cache uses to choose which existing entry to remove once it runs out of space.

A cache has finite memory. When a new write arrives and the cache is full, something must be discarded — the policy decides what, and a good choice keeps the hottest data resident while a bad one evicts entries you're about to need.

## The common policies

- **LRU (least recently used)** — drop the entry untouched for the longest, betting that recent access predicts future access. The usual default.
- **LFU (least frequently used)** — drop the entry with the fewest hits, favoring durably popular keys over briefly-spiking ones.
- **FIFO** — drop the oldest insertion regardless of access. Simple, but ignores how often entries are actually used.
- **Random / TTL-based** — evict an arbitrary key, or the one closest to expiry. Cheap, used when approximating LRU exactly is too costly.

## Choosing a policy

It depends on the access pattern. **LRU** suits *temporal locality* — workloads where recently-used keys are likely to be used again soon (sessions, recent items). **LFU** suits a *stable hot set* — a fixed group of keys that stay popular over time — but it can cling to keys that *were* popular long after they've gone cold, since their old hit count lingers. Many production caches use approximations (segmented LRU, sampled LFU) rather than exact implementations, because tracking true recency or frequency for every key is itself expensive.

## Pitfalls

Eviction is distinct from [[cache-ttl|TTL]] expiry, and conflating them causes confusion: TTL removes *stale* data on a timer, eviction removes *any* data to free space — an entry can be evicted while still fresh. Under-provisioned memory turns a cache into a churn machine where hot keys are evicted before reuse (the hit rate collapses and every request pays the origin cost), so the policy matters far less than simply having enough headroom. [[redis|Redis]] exposes the policy as configuration (`maxmemory-policy`); the default may not match your workload.
