---
title: Message deduplication
description: Detecting repeated messages so repeated delivery does not repeat side effects.
tags:
  - messaging
---

**Message deduplication** detects when a message has already been processed, so [[at-least-once-delivery|at-least-once]] redelivery doesn't repeat its side effects.

It pairs with [[../web/api/idempotency|idempotency]] to make retries safe, and is the practical mechanism behind an [[idempotent-consumer|idempotent consumer]].

## How it works

Each message carries a stable identifier — either a broker-assigned message id or, better, a *business* id like `orderId` or a client-supplied idempotency key. The consumer keeps a record of ids it has already handled. On each delivery it checks: seen before → skip; new → process, then record the id. The check-and-record must be atomic with (or before committing) the work, or a crash in the gap reintroduces the duplicate.

A common implementation stores processed ids in a fast store with a TTL — a [[../redis/redis-ttl|Redis key]] or a unique constraint on a dedup table. The TTL bounds memory by assuming duplicates arrive within some window; ids older than that are forgotten.

## When to use

Use dedup when the operation is *not* naturally idempotent and a repeat is harmful: charging a card, sending an email, decrementing inventory. When the operation is already idempotent by construction (writing an absolute value, an upsert keyed by id), you may not need a separate dedup layer at all — the work itself absorbs the repeat.

## Choosing the dedup window

The TTL on the seen-id store is the central design tension: too short and a late redelivery slips through as a duplicate; too long and the store grows without bound. The window should comfortably exceed the broker's maximum redelivery delay, so it's sized from the messaging system's retry behavior, not guessed. This is the cost the pattern adds — a stateful store with its own consistency and capacity concerns, in exchange for safe retries.

## Pitfalls

Deduping on the broker's message id rather than a business id fails when the *same logical event* is published twice as two different messages — they have different message ids but should be treated as one. The atomicity gap bites when an id is recorded before the work commits (a crash loses the work but the id says "done") or after (a crash reprocesses) — record and work in one [[transaction|transaction]]. And a dedup store that isn't shared across consumer instances only deduplicates within one instance, so a [[consumer-group|rebalance]] moving a partition to a new consumer reprocesses anyway.
