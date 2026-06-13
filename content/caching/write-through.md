---
title: Write-through
description: A caching pattern where writes go through the cache to the backing store.
tags:
  - caching
---

**Write-through** is a [[caching|caching]] pattern where every write goes to the cache *and* the backing store synchronously, as part of the same write operation.

The point is to keep the cache always consistent with the source of truth, so reads never serve a value the cache missed updating.

## How it works

A write updates the cache entry and the database together, and only reports success once both have completed. The cache is therefore never behind the database — any value present in the cache is the latest written value. Reads can then trust the cache fully without the staleness window that [[cache-aside|cache-aside]] leaves open.

## Compared to other write patterns

- **Write-through** — write cache + DB synchronously. Consistent reads, slower writes.
- **Write-back (write-behind)** — write cache now, flush to DB asynchronously later. Fast writes, but a crash before the flush loses data.
- **Write-around** — write only the DB, skip the cache; let reads populate it lazily. Good when written data is rarely read soon after.

The choice is a position on the same axis: how much write latency and risk you trade for read consistency.

## When to use

Use write-through when reads must reflect writes immediately and the data is read often enough to justify caching it on every write. It pairs well with a read-heavy key that's also updated in a path where the extra write latency is acceptable.

## Pitfalls

It adds latency to *every* write, including writes to data that may never be read again — write-around or cache-aside avoid that waste. It also doesn't make the two writes atomic: if the DB write succeeds and the cache write fails (or vice versa), they diverge, so you still need a [[cache-ttl|TTL]] or reconciliation as a backstop. And caching data on write that's rarely read just fills the cache with cold entries that crowd out hot ones under the [[eviction-policy|eviction policy]].
