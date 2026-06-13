---
title: Outbox pattern
description: A pattern for reliably publishing events after database changes.
tags:
  - messaging
  - database
---

The **outbox pattern** writes an event into the same database [[transaction|transaction]] as the state change it describes, so the two either both commit or both roll back.

This closes the failure window where the database commit succeeds but publishing the event to a broker fails (or vice versa), leaving state and events out of sync.

## How it works

The problem it solves is the **dual write**: updating the database and publishing to a [[message-queue|message queue]] are two separate systems with no shared transaction, so a crash between them leaves you with one done and the other not. There is no atomic "commit DB and publish" across both.

The outbox makes the write atomic by keeping it in *one* system. Inside the business transaction, you `INSERT` the event into an `outbox` table alongside the state change. Because they're in the same transaction, the event is persisted if and only if the state change is. A separate **relay** process then reads unpublished rows from the outbox and publishes them to the broker, marking each as sent once the broker acks. If the relay crashes mid-publish, it simply re-reads and republishes on restart.

```sql
BEGIN;
  UPDATE orders SET status = 'paid' WHERE id = 123;
  INSERT INTO outbox (id, type, payload) VALUES (gen_random_uuid(), 'OrderPaid', '{...}');
COMMIT;
```

The relay reads the outbox either by polling or by tailing the database's replication log via [[../database/change-data-capture|change data capture]].

## When to use

Use it whenever a state change must reliably produce an event and you can't tolerate the two drifting apart — order paid → publish `OrderPaid`, user signed up → publish `UserRegistered`. It's the standard fix for the dual-write problem in [[event-driven|event-driven]] systems backed by a relational database.

## Trade-offs

You get atomicity without a distributed transaction, but you add an outbox table, a relay process to operate, and latency: the event isn't published at commit time, only when the relay next picks it up. The pattern also only guarantees the event is *published*, not that it's published once.

## Pitfalls

The relay can crash after publishing but before marking the row sent, so it republishes — making the outbox an [[at-least-once-delivery|at-least-once]] publisher, which means consumers still need [[idempotency|idempotency]] or [[message-deduplication|deduplication]]. Polling relays add load and latency unless indexed and batched well. And the outbox table grows forever without a cleanup job to prune (or archive) rows that have been confirmed published.
