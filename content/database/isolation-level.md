---
title: Isolation level
description: A database setting that controls how concurrent transactions see each other's changes.
tags:
  - database
---

An **isolation level** controls what one [[transaction|transaction]] can observe of other in-flight transactions — the dial that trades concurrency anomalies against locking and contention.

## The anomalies it prevents

Isolation levels are defined by which read anomalies they rule out:

- **Dirty read** — seeing another transaction's *uncommitted* changes, which may still roll back.
- **Non-repeatable read** — reading the same row twice in one transaction and getting different values because another transaction committed an update in between.
- **Phantom read** — re-running the same range query and finding new rows that another transaction inserted.

## The levels

Each level rules out more anomalies, at rising cost:

- **Read uncommitted** — allows even dirty reads. Rarely useful.
- **Read committed** — only sees committed data; prevents dirty reads. The common default (Postgres, Oracle).
- **Repeatable read** — a transaction sees a stable snapshot; prevents non-repeatable reads (and, in Postgres's MVCC implementation, most phantoms too).
- **Serializable** — the strongest: the result is as if transactions ran one at a time. Prevents all three, at the highest contention/abort cost.

## Choosing

Pick the level from the **invariant the workflow must protect**, not the default. Most reads are fine on read committed. But logic that reads a value, decides on it, and writes back — checking a balance before a withdrawal, reserving the last inventory unit — can be corrupted by concurrent transactions under weak isolation, and needs repeatable read or serializable (or explicit locking). The mistake is assuming the default prevents these; it doesn't. Stronger isolation increases waits, [[deadlock|deadlocks]], and serialization failures, so the higher levels require the application to **retry** aborted transactions — code that runs at serializable but never handles a serialization-failure retry is subtly broken.
