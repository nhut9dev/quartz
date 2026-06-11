---
title: Eviction policy
description: How a full cache decides which entries to drop to make room for new ones.
tags:
  - caching
---

An **eviction policy** is the rule a cache uses to choose which existing entry to remove once it runs out of space.

A cache has finite memory. When a new write arrives and the cache is full, something must be discarded.

LRU (least recently used) drops the entry untouched for the longest, betting that recent access predicts future access. LFU (least frequently used) drops the entry with the fewest hits, favoring durably popular keys. FIFO simply drops the oldest insertion, ignoring access patterns.

The right choice depends on workload. LRU suits temporal locality; LFU suits stable hot sets but can cling to once-popular keys.

Eviction is distinct from [[cache-ttl|TTL]] expiry: TTL removes stale data, eviction removes data to free space. See [[redis|Redis]] for configurable policies.
