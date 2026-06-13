---
title: ACID
description: "Four database transaction properties: atomicity, consistency, isolation, and durability."
tags:
  - database
---

**ACID** is the set of four guarantees — atomicity, consistency, isolation, durability — that a [[transaction|transaction]] provides, and the reason relational databases can be trusted with money, inventory, and other data where correctness beats speed.

## The four properties

- **Atomicity** — all operations in a transaction commit together or none do. A half-applied transfer (debited but not credited) is impossible; on any failure the whole thing rolls back.
- **Consistency** — a transaction moves the database from one valid state to another, with all constraints (foreign keys, uniqueness, checks) satisfied at commit. It can't leave the database violating its own rules.
- **Isolation** — concurrent transactions don't corrupt each other; the result is as if they ran in some serial order. *How much* isolation is the dial set by the [[isolation-level|isolation level]].
- **Durability** — once committed, data survives crashes and power loss, because the commit is persisted (typically to a write-ahead log) before being acknowledged.

## When it matters

ACID is essential when a wrong answer is expensive: payments, ledgers, inventory, permissions, anything where temporary inconsistency causes real harm. There it's worth the coordination cost. Systems that favor availability and scale over strict correctness (many [[nosql|NoSQL]] stores) deliberately relax it toward [[../architecture/eventual-consistency|eventual consistency]], which is the right call when stale-for-a-moment is harmless.

## Pitfalls

The subtle one is reading **Consistency** as the same "C" in [[../architecture/cap-theorem|CAP]] — they're unrelated; ACID's C is about constraints within one node, CAP's is about agreement across nodes. **Isolation** is also routinely overestimated: the common default (`READ COMMITTED`) is far weaker than full serializability, so "ACID" alone doesn't mean concurrent transactions can't interleave in surprising ways — the isolation level decides that, and the default permits anomalies many developers assume are prevented.
