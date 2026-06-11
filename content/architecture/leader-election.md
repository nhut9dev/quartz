---
title: Leader election
description: Choosing a single coordinator among interchangeable instances to run work that must happen once.
tags:
  - architecture
  - distributed-systems
  - resilience
---

**Leader election** picks one instance out of many to act as the coordinator, so work that must happen exactly once has a single owner.

You need it whenever a job is a singleton in a fleet of identical replicas: a cron that must fire once, a primary writer in a replicated store, the assigner of partitions to consumers. Every node is capable; the cluster just has to agree on which one does it now.

## How it works

The common approach is lease-based. Candidates race to acquire a short-lived lock or lease in a coordination store, and the winner is leader for the duration of the lease, renewing it via heartbeat to stay in charge. If it crashes, the lease expires and another node takes over. This is the same primitive as a [[../system-design/distributed-lock|Distributed lock]], applied to "who is in charge" rather than "who holds this resource."

Production systems lean on consensus stores built for this: ZooKeeper, etcd, or Consul, which use a consensus algorithm such as Raft internally to keep a consistent view of the lease across their own replicas.

## Pitfalls

The central danger is split-brain: two nodes both believe they are leader, usually after a network partition or a leader that paused (GC, VM freeze) past its lease without realizing it. Two writers then corrupt state. A lease expiring is not enough, because the old leader may not yet know it lost the lease.

The fix is fencing tokens: each lease grant carries a monotonically increasing number, and downstream resources reject any write stamped with a token older than the highest they have seen.

```js
// storage rejects stale leaders by token
if (token < store.maxToken) throw new FencedError();
store.maxToken = token;
```

## Tradeoffs

Leader election trades availability for safety, the [[cap-theorem|CAP theorem]] tension made concrete: during an election there is briefly no leader, and a partition may leave a minority unable to elect one rather than risk two. It underpins [[../system-design/leader-follower-replication|Leader-follower replication]], where electing the new primary on failover is the hard part.
