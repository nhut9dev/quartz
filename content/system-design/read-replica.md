---
title: Read replica
description: A database copy used to scale read traffic away from the primary.
tags:
  - system-design
  - database
---

A **read replica** is a database copy that serves read traffic while the primary handles writes — the standard way to scale reads, since most applications read far more than they write.

It's the practical application of [[leader-follower-replication|leader-follower replication]] and [[../database/replication|database replication]].

## How it works

The primary streams its changes to one or more replicas, which apply them and answer `SELECT`s. The application routes writes to the primary and reads to a replica (often via a proxy or a separate connection pool). Because reads can be spread across many replicas, read capacity scales close to linearly by adding replicas — without adding any load to the write path. Replicas also isolate expensive or analytical queries so a heavy report doesn't compete with transactional traffic on the primary.

## When to use

Reach for read replicas when reads dominate and the primary is read-bound, when you want to offload reporting/analytics from the transactional database, or when you need geographically closer reads. The key precondition: the reads must tolerate being slightly stale. Note it scales *reads* only — a write-bound workload gets no relief from replicas and needs [[../database/sharding|sharding]] instead.

## Pitfalls

**Replication lag** is the defining trade-off: a user writes to the primary, then a follow-up read hits a replica that hasn't caught up and shows stale (or missing) data — the [[../architecture/eventual-consistency|read-your-writes]] surprise. Mitigate by routing reads that *must* be fresh to the primary, or pinning a user to the primary briefly after a write. Routing reads to replicas blindly also breaks transactions that read-then-write assuming one consistent view. And lag isn't constant — it spikes under write bursts or replica load, so a flow that "usually" reads fresh data will intermittently fail in production.
