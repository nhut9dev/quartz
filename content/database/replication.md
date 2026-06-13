---
title: Replication
description: Copying database data from one node to another for availability, reads, or recovery.
tags:
  - database
---

**Replication** keeps copies of a database's data on more than one node, so the system can survive a node failure, scale reads, and recover from disaster.

## How it works

The primary streams its changes — typically its write-ahead log — to one or more replicas, which replay those changes to stay in sync. The most common topology is [[../system-design/leader-follower-replication|leader-follower]]: one node takes writes, replicas copy them and serve reads. This gives three distinct benefits: **read scaling** (spread reads across replicas, see [[../system-design/read-replica|read replica]]), **availability** (a replica can be promoted on [[../system-design/database-failover|failover]]), and **disaster recovery** (a copy survives if the primary is lost).

## Synchronous vs asynchronous

The key trade-off is *when* the primary considers a write done:

- **Synchronous** — the primary waits for a replica to confirm before acknowledging the write. No committed write is lost on failover, but write latency includes the round trip, and a slow or down replica can stall writes.
- **Asynchronous** — the primary acknowledges immediately and ships changes in the background. Fast and resilient to slow replicas, but writes not yet copied are lost if the primary dies, and replicas trail behind.

Most systems run async (or semi-synchronous to one replica) because the latency cost of full sync is high.

## Pitfalls

**Replication lag** is the defining issue of async replication: a user writes to the primary, then a follow-up read served by a lagging replica shows stale or missing data — the [[../architecture/eventual-consistency|read-your-writes]] surprise. Route reads that must be fresh to the primary, and treat lag as variable (it spikes under write bursts), not a fixed small constant. Replication also scales *reads* only — it does nothing for a write-bound workload, which needs [[sharding|sharding]] instead. And async replication makes a conscious durability choice: design reads and failover knowing the most recent writes may not have reached the replica yet.
