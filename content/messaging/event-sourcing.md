---
title: Event sourcing
description: Storing state as an append-only log of events rather than as current-value rows.
tags:
  - messaging
---

**Event sourcing** persists every change to application state as an immutable event in an append-only log, and derives current state by replaying those events.

Instead of overwriting a row to its latest value, you append facts like `OrderPlaced` and `OrderShipped`. The present state is a fold over the full history.

This yields a complete audit trail, the ability to reconstruct past states, and a natural fit for [[event-driven|event-driven]] systems, since the log is itself a stream of events.

The cost is complexity: queries against current state require rebuilding or maintaining projections, and changing event schemas over time is delicate.

It pairs naturally with [[cqrs|CQRS]], where the event log is the write model and projections form read models. Streams like [[kafka|Kafka]] often store the log.
