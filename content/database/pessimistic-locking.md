---
title: Pessimistic locking
description: Locking data before editing it to prevent conflicting writes.
tags:
  - database
---

**Pessimistic locking** assumes conflicts are likely and *blocks* other writers up front — it takes a lock before the work and holds it until commit, so no one else can touch the row in between.

## How it works

Inside a [[transaction|transaction]], the reader takes an explicit row lock (in SQL, `SELECT ... FOR UPDATE`). Any other transaction trying to lock or write that row **waits** until the first commits or rolls back. This serializes access to the contended row: while you hold the lock, you have a guarantee that the value you read won't change under you before you write — exactly what a read-modify-write needs.

```sql
BEGIN;
  SELECT stock FROM items WHERE id = 1 FOR UPDATE;  -- others now block here
  UPDATE items SET stock = stock - 1 WHERE id = 1;
COMMIT;  -- lock released
```

## Compared to optimistic

The mirror image of [[optimistic-locking|optimistic locking]]: pessimistic pays the cost *upfront* (everyone waits, but the writer is guaranteed to succeed without retry), while optimistic pays it *at the end* (no waiting, but a conflict means redo the work). Pessimistic wins when contention is high (retries would thrash) and the locked section is short; optimistic wins when conflicts are rare or the edit window is too long to hold a lock.

## Pitfalls

Locks held too long are the core danger: a transaction that takes a lock and then does slow work (or worse, a network call) makes everyone behind it wait, throttling throughput. Acquiring multiple locks in inconsistent order across code paths invites [[deadlock|deadlocks]]. And it's unusable across human think-time — you cannot hold a row lock while a user fills in a form, which is precisely the case optimistic locking exists for. Reach for it only when correctness needs immediate exclusion and the critical section is genuinely brief, like an inventory reservation or balance update.
