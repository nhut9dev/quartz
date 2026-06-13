---
title: Eventual consistency
description: A consistency model where replicas converge after some delay.
tags:
  - architecture
  - database
---

**Eventual consistency** is a model where copies of data may differ for a while, but are guaranteed to converge to the same value once updates stop propagating — trading immediate agreement for availability and scale.

## How it works

A write is accepted at one replica and acknowledged *before* it has reached all the others; the update then propagates asynchronously. For a window — usually milliseconds, sometimes longer under load or partition — different replicas can return different answers for the same key. The guarantee is only that, absent new writes, they'll all settle on the same value.

This is the [[cap-theorem|CAP]] choice made concrete: by answering from whichever replica is reachable instead of waiting for all of them to agree, the system stays available during a partition (AP) at the cost of possibly-stale reads. When concurrent writes hit different replicas, convergence needs a conflict-resolution rule — last-write-wins, version vectors, or CRDTs — to decide the final value deterministically.

## When to use

It fits where availability and scale matter more than reading your own writes instantly, and where brief staleness is harmless: [[replication|replicated]] databases, [[caching|caches]], search indexes that lag the source, [[event-driven|event-driven]] systems, and globally-distributed data. A like count, a search result, a follower list — all tolerate being a second behind.

## Pitfalls

The trap is using it where users expect **read-your-writes**: someone updates their profile, immediately reloads, and sees the old value because the read hit a lagging replica — a confusing "did it save?" moment. Handle it explicitly (pin the user to the primary briefly, or read from the write path) rather than pretending consistency is immediate. It also breaks invariants that span items — "balance never goes negative" can't be enforced across replicas that don't yet agree — so money and inventory usually need stronger consistency or compensating reconciliation. Product flows must be designed for stale reads, retries, and convergence, not assume them away.
