---
title: Deadlock
description: A database concurrency problem where transactions wait on each other forever.
tags:
  - database
---

A **deadlock** is a cycle of transactions each holding a lock the other needs, so neither can proceed — without intervention they'd wait forever.

## How it happens

The textbook case: transaction A locks row 1 and then tries to lock row 2; transaction B has already locked row 2 and now tries to lock row 1. A waits on B, B waits on A — a cycle. The root cause is almost always **inconsistent lock ordering**: two code paths acquire the same set of locks in different orders, so they can interleave into a cycle. It can also arise more subtly from index/gap locks or from foreign-key checks taking locks you didn't write explicitly.

## How databases handle it

Databases run a deadlock detector that periodically looks for cycles in the wait-for graph. On finding one, it picks a **victim** (usually the cheapest to undo) and aborts it with a deadlock error, freeing its locks so the others continue. So a deadlock isn't a hang — it surfaces as an error returned to one transaction, which is why the application has to be ready for it.

## Preventing them

- **Consistent lock ordering** — always acquire locks in the same order (e.g. ascending primary key), which makes a cycle impossible. The single most effective fix.
- **Shorter transactions, smaller write scope** — hold fewer locks for less time, shrinking the window for a cycle.
- **Retry on deadlock error** — since the loser's transaction is aborted cleanly, a safe (idempotent) transaction can simply be retried, often succeeding on the second attempt once contention clears.

The common mistake is treating a deadlock error as a fatal bug rather than an expected, retryable outcome of concurrency — under load, occasional deadlocks are normal and the fix is graceful retry plus better lock ordering, not panic.
