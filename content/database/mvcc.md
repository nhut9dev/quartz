---
title: MVCC
description: A concurrency technique that keeps multiple versions of a row so readers and writers don't block each other.
tags:
  - database
  - concurrency
---

**MVCC** (multi-version concurrency control) lets each transaction see a consistent snapshot of the data by keeping multiple versions of each row.

## How it works

Instead of locking a row for reads, the database stores versions tagged with the transaction that created or deleted them. When a transaction starts (or each statement starts, depending on [[isolation-level|isolation level]]), it gets a snapshot: it sees only versions committed before it and ignores newer ones. An `UPDATE` writes a new version and links it to the old, forming a version chain rather than overwriting in place.

The big win is that **readers never block writers and writers never block readers**. Read consistency comes from snapshots, not locks.

## Tradeoffs

Old versions linger until no [[transaction|transaction]] can still see them. In Postgres, `VACUUM` reclaims those dead tuples; if it falls behind, tables and indexes bloat, scans slow down, and the transaction ID counter can approach wraparound. High-churn tables need autovacuum tuned aggressively.

## Pitfalls

MVCC removes read locks but not write conflicts. Two transactions updating the same row still serialize, and under repeatable read or serializable one may be aborted with a serialization error that the application must retry. Long-running transactions are especially harmful: they hold back the cleanup horizon and let dead versions accumulate across the whole database.
