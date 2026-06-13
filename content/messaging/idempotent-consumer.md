---
title: Idempotent consumer
description: A consumer that produces the same result no matter how many times it processes a message.
tags:
  - messaging
---

An **idempotent consumer** can process the same message more than once without changing the outcome beyond the first time.

This matters because most message systems offer [[at-least-once-delivery|at-least-once delivery]]: retries and redeliveries mean duplicates are normal, not exceptional. Idempotency is the practical foundation for approximating [[exactly-once|exactly-once]] processing and for safely retrying steps in a [[saga|saga]].

## How it works

There are two routes to idempotency. The first is **natural idempotency**: design the operation so repeating it is inherently safe — `SET status = 'paid'` is the same whether run once or five times, whereas `balance = balance - 10` is not. An upsert keyed by id, or writing an absolute value rather than a delta, makes the handler repeat-safe with no extra bookkeeping.

When the operation can't be made naturally idempotent (charging a card, sending an email), the second route is **[[message-deduplication|deduplication]]**: record each handled message's id and skip any id seen before. The check-and-record has to be atomic with the side effect, or a crash in the gap reintroduces the duplicate. A common shape wraps the dedup write and the business write in one [[transaction|transaction]]:

```sql
BEGIN;
  INSERT INTO processed_messages (id) VALUES ('msg-123'); -- unique; fails if duplicate
  UPDATE accounts SET balance = balance - 10 WHERE id = 1;
COMMIT;
```

If the `INSERT` violates the unique constraint, the message was already processed and the whole transaction aborts — a harmless no-op.

## When to use

Make every consumer on an at-least-once channel idempotent; it isn't an optimization but a correctness requirement. Prefer natural idempotency where the domain allows it (less state, no dedup store to operate), and fall back to explicit deduplication only for operations with non-repeatable side effects.

## Pitfalls

Deduping on the broker's message id misses the case where the same logical event is published twice as two different messages — dedup on a *business* id when one exists. Committing the offset or recording the id *before* the work commits turns a crash into silent loss; doing it after, non-atomically, lets the duplicate through. And a dedup store local to one instance fails after a [[consumer-group|rebalance]] moves the partition to a peer that hasn't seen those ids — the store has to be shared.
