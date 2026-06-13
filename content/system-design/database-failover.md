---
title: Database failover
description: Moving database traffic to a healthy node when the primary database is unavailable.
tags:
  - system-design
  - database
  - reliability
---

**Database failover** promotes a replica to primary (or routes traffic to a healthy node) when the current primary can't serve traffic, so the system recovers from a database outage without manual rebuild.

It builds on [[../database/replication|replication]] — there has to be an up-to-date copy ready to take over.

## How it works

A health signal (missed heartbeats, failed writes, an unreachable node) declares the primary down. A promotion step makes a chosen [[read-replica|follower]] the new primary, and clients are redirected — via a virtual IP, a proxy, DNS, or a connection string that knows the cluster topology. The new primary begins accepting writes; the old one, if it returns, must rejoin as a follower rather than resume as primary.

## Automatic vs manual

The core decision is who pulls the trigger. **Automatic failover** minimizes downtime — promotion happens in seconds without waking anyone — but a wrong call (promoting on a transient network blip) is itself an outage, and it's prone to split-brain. **Manual failover** is slower (minutes, and someone must be on call) but an operator can confirm the primary is *really* dead, check replication lag, and decide whether some data loss is acceptable before promoting. High-availability setups automate; setups where a wrong promotion is costlier than a few minutes of downtime often keep a human in the loop.

## Pitfalls

**Split-brain** is the defining danger: a network partition makes each side think the other is dead, two primaries accept writes, and the histories diverge irreconcilably — fencing or quorum is what prevents it. **Lost writes** happen when a primary fails with writes not yet replicated; promoting a lagging follower silently drops them, so the acceptable lag must be a conscious choice. And the failover path itself is often the *least-tested* code in the system — it only runs in a crisis, so teams discover the reconnection logic, the backup plan, and the post-recovery data verification are broken exactly when they're needed. See also [[../sre/disaster-recovery|disaster recovery]].
