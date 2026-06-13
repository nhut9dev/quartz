---
title: Transaction
description: A group of database operations that succeed or fail together.
tags:
  - database
---

A **transaction** groups database operations into a single unit that either commits entirely or rolls back entirely — the mechanism behind the [[acid|ACID]] guarantees.

## How it works

A transaction begins, runs a sequence of reads and writes, and ends with either `COMMIT` (make all changes permanent and visible) or `ROLLBACK` (discard them as if they never happened). Until commit, the changes are provisional — held in a way that other transactions don't see, per the [[isolation-level|isolation level]]. The classic case is a transfer: debit one account and credit another in the same transaction, so a failure between the two leaves *neither* applied rather than money vanishing.

```sql
BEGIN;
  UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT; -- both, or (on error) neither
```

Durability is provided by writing the commit to a log before acknowledging, so a crash right after commit still keeps the data.

## When to use

Wrap any workflow where partial completion is a bug: multi-row money movement, inventory decrement plus order creation, permission changes, or any invariant that spans more than one write. If the operations must all be true together or all false, they belong in one transaction.

## Pitfalls

**Long-running transactions** are the main hazard — a transaction held open across a network call, a user's think-time, or a slow loop holds locks and pins old row versions the whole time, causing waits, [[deadlock|deadlocks]], and bloat. Keep transactions short and don't span them across user interaction; for edits that outlive a safe transaction window, use [[optimistic-locking|optimistic locking]] instead. Also beware doing external side effects (sending an email, calling an API) inside a transaction: those can't be rolled back, so a later rollback leaves them done anyway — see the [[../messaging/outbox-pattern|outbox pattern]].
