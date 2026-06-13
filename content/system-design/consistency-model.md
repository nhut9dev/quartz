---
title: Consistency model
description: The rules that describe what reads can observe after writes in a distributed system.
tags:
  - system-design
  - distributed-systems
---

A **consistency model** is the contract for what a reader is allowed to observe after data changes — the rule that says whether a read is guaranteed to see the latest write, an older one, or something in between.

## The spectrum

Consistency models form a spectrum from strongest to weakest:

- **Strong (linearizable)** — every read sees the most recent write, as if there were one copy. Simplest to reason about, most expensive to provide.
- **Read-your-writes** — you always see your *own* writes, though not necessarily others' immediately. Often what users actually expect.
- **Monotonic reads** — you never see time go backwards (a value you saw won't un-appear on a later read).
- **[[../architecture/eventual-consistency|Eventual]]** — replicas converge if writes stop, but until then any read may be stale. Cheapest, most available.

Each step weaker buys more availability and lower latency (fewer nodes must coordinate per operation) at the cost of a more surprising mental model.

## Choosing per workflow

The key discipline is choosing the model **per workflow, not per system**. One application has writes with wildly different freshness needs: a payment or a permission check needs strong consistency, a follower count or a search index is fine eventually consistent, a user's own profile edit needs at least read-your-writes. Picking one global model forces every operation to pay the price of the strictest one — or exposes the laxest one's staleness where it's dangerous.

## Pitfalls

The expensive mistake is assuming strong consistency by default and discovering only in production that a [[read-replica|replica]] or [[cache-consistency|cache]] serves stale data — the [[../architecture/eventual-consistency|read-your-writes]] surprise. Conversely, over-applying strong consistency where it isn't needed serializes operations that could have run independently, capping throughput. Make the tolerance explicit for each flow before choosing the replication, cache, and [[../caching/cache-invalidation|invalidation]] rules that implement it.
