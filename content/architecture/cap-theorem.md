---
title: CAP theorem
description: A distributed systems idea about consistency, availability, and partition tolerance.
tags:
  - architecture
---

**CAP theorem** states that when a network partition occurs, a distributed system must choose between consistency and availability — it cannot have both while the partition lasts.

## What it actually says

The three letters: **Consistency** (every read sees the latest write, or an error), **Availability** (every request gets a non-error response), **Partition tolerance** (the system keeps working despite messages being lost between nodes).

The real content of the theorem is narrow: *during a partition*, when two nodes can't talk, you face a forced choice. Either refuse to answer until you can guarantee the value is current (choose C, sacrifice A), or answer with possibly-stale data (choose A, sacrifice C). There's no third option, because the one guarantee you can't make during a partition is "this answer is both current and given."

## The common misreading

CAP is usually mangled as "pick 2 of 3," as if P were an option you trade away alongside C and A. It isn't. In any real network, partitions *will* happen — packets drop, links fail — so P is non-negotiable. That collapses the choice to **CP vs AP**: when a partition hits, do you sacrifice availability (CP, like a strongly-consistent database that refuses writes on the minority side) or consistency (AP, like a system that accepts writes everywhere and reconciles later into [[eventual-consistency|eventual consistency]])?

## In practice

The choice isn't global or permanent — it's per-operation and only binds *during* a partition. A bank might be CP for transfers but AP for showing a cached balance. When there's no partition (the normal case), you get both C and A, which is why **PACELC** extends CAP: else (no partition), the trade is between latency and consistency. Treat CAP as a lens for reasoning about partition behavior, not a literal menu you order from once for the whole system.
