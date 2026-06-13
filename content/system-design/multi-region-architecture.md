---
title: Multi-region architecture
description: Running an application across multiple geographic regions for latency, resilience, or compliance.
tags:
  - system-design
  - reliability
---

A **multi-region architecture** runs an application across more than one geographic region — to cut latency for distant users, survive a whole-region outage, or keep data inside a legal jurisdiction. The catch is that the stateless tier is easy to replicate; the *data* is where multi-region gets hard.

## Active-passive vs active-active

The topology choice frames everything else:

- **Active-passive** — one region serves all traffic; another stands by, kept warm via replication, ready to take over on failover. Simpler, because only one region takes writes, so there are no cross-region write conflicts. The cost is idle standby capacity and a failover step that must actually work.
- **Active-active** — multiple regions serve traffic simultaneously. Best latency (users hit the nearest region) and best resilience (losing one region drops a fraction of capacity), but now two regions can write the same data at once, making conflict resolution and the [[consistency-model|consistency model]] the central design problem.

## What gets hard

Stateless app servers replicate trivially; the difficulty is **state**. Synchronous cross-region replication is slow (physics — light takes ~30–60ms across an ocean round-trip), so most multi-region data is asynchronously replicated and therefore [[../architecture/eventual-consistency|eventually consistent]] across regions. That forces decisions on write routing (one home region per record? write anywhere?), conflict resolution for concurrent writes, [[database-failover|failover]] behavior, and data residency for compliance.

## Pitfalls

Cross-region calls are an order of magnitude slower than in-region; an architecture that chats back and forth across regions per request erases the latency benefit it was built for — keep each request served within one region. Active-active without a real conflict-resolution strategy produces silent data corruption when two regions edit the same record. And the failover path in active-passive is the usual untested-until-the-crisis code — DNS TTLs, replica promotion, and client reconnection all need rehearsal, or the standby region won't actually save you.
