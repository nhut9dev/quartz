---
title: Event sourcing
description: Storing state as an append-only log of events rather than as current-value rows.
tags:
  - messaging
---

**Event sourcing** persists every change to application state as an immutable event in an append-only log, and derives current state by replaying those events.

Instead of overwriting a row to its latest value, you append facts like `OrderPlaced` and `OrderShipped`. The present state is a fold over the full history.

## How it works

The log is the source of truth; current state is a *derivation*, not the stored thing. To load an entity, you read its event stream and replay (fold) the events to rebuild its current state. Because replaying a long history on every read is expensive, systems take periodic **snapshots** — a materialized state at offset N — so replay only needs events after the latest snapshot.

Events are immutable and append-only: you never edit or delete history. A mistake is corrected by appending a *new* compensating event, not by mutating the old one. This is what gives event sourcing its defining property — a complete, replayable audit trail — and what makes it a natural fit for [[event-driven|event-driven]] systems, since the log is itself a stream of events others can subscribe to.

## When to use

Reach for it when history *is* the requirement: audit and compliance domains where "how did we get to this state" matters as much as the state itself (ledgers, [[../domains/finance/business/reconciliation|reconciliation]], medical records), or when you need to derive new read models retroactively by replaying the past into them. It pairs naturally with [[cqrs|CQRS]], where the event log is the write model and projections form the read models. The log is often kept in a stream like [[kafka|Kafka]].

## Trade-offs

You gain a perfect audit trail, time-travel to any past state, and the ability to build new projections from old events — at the cost of significant complexity. Querying current state requires projections or replay rather than a simple `SELECT`, and the model is unfamiliar to most teams.

## Pitfalls

**Schema evolution** is the hard part: events written years ago must still be replayable after the code that interprets them has changed, which forces event versioning and upcasting and rules out casually changing a field's meaning. Replay without snapshots gets slower as history grows. And it's easy to over-apply — most CRUD entities don't need their full history, and event-sourcing them buys delicate machinery in exchange for an audit trail nobody asked for.
