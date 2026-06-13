---
title: Leader-follower replication
description: A replication model where one node accepts writes and followers copy its changes.
tags:
  - system-design
  - database
---

**Leader-follower replication** (primary-replica) designates one node as the leader that accepts all writes, while one or more followers copy the leader's changes and serve reads. It's the most common replication topology and the foundation under [[read-replica|read replicas]] and [[database-failover|failover]].

## How it works

All writes go to the leader, which applies them and streams its change log (the WAL/binlog) to each follower; followers replay that log to stay in sync. Routing a single write path through the leader sidesteps write-write conflicts entirely — there's only ever one node deciding the order of writes, so the followers just have to catch up.

Replication is either **synchronous** (the leader waits for a follower to confirm before acknowledging the write — no data loss on failover, but higher write latency and a stall if the follower is slow) or **asynchronous** (the leader acks immediately and replicates in the background — fast, but writes not yet copied are lost if the leader dies). Most systems use async, or semi-sync to one follower.

## What it buys

One clear write path with no conflict resolution; read scaling by adding followers; redundancy and a ready promotion target for failover; and isolation of heavy or analytical reads onto followers, away from the write leader.

## Pitfalls

**Replication lag** is the central issue: followers trail the leader by milliseconds to seconds, so a user who writes to the leader and immediately reads from a follower sees stale data — the [[../architecture/eventual-consistency|read-your-writes]] problem. The leader is a **write bottleneck and single point of failure** — followers scale reads but not writes, so a write-heavy workload eventually needs [[../database/sharding|sharding]], not just more followers. And async replication means failover can silently lose the most recent writes, so the sync/async choice is really a durability-vs-latency decision, not a default to accept blindly.
