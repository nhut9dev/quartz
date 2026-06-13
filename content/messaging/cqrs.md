---
title: CQRS
description: Separating the model that handles writes from the model that serves reads.
tags:
  - messaging
---

**CQRS** (Command Query Responsibility Segregation) splits an application into a write model that handles commands and a separate read model that serves queries.

In a traditional design, one model handles both. CQRS recognizes that writes and reads often want different shapes: writes need validation and invariants, reads need fast, denormalized views.

## How it works

Commands (state changes) go to the write model, which enforces business rules and invariants in a normalized shape built for correctness. Queries go to a separate read model — one or more **projections** precomputed and denormalized for exactly the queries the UI makes, so a read is a single lookup instead of a multi-table join.

The two models are kept in sync asynchronously: a write emits an event, and a projector consumes it to update the read side. That propagation is what lets each side scale and deploy independently — you can run many read replicas of a hot query view without touching write throughput — but it's also the source of the lag between them.

## When to use

CQRS earns its complexity when read and write workloads diverge sharply: reads vastly outnumber writes, the query shapes differ from the write shape, or different read views need wildly different optimizations. It's a strong fit alongside [[event-sourcing|event sourcing]], where commands append events and projections naturally build the read side, and is common in [[event-driven|event-driven]] systems generally.

## Trade-offs

You gain independent scaling and read models tuned per-query, at the cost of two models to maintain, the projection machinery to keep them in sync, and [[eventual-consistency|eventual consistency]] — the read model lags the write by the propagation delay. For a simple CRUD app, that's pure overhead: a single model is simpler and strictly better.

## Pitfalls

The most common mistake is applying CQRS everywhere by default; it's a targeted tool, not a baseline architecture, and the indiscriminate version adds layers without payoff. The read/write lag surprises UIs that expect read-your-writes — a user saves and immediately re-queries the stale read model, seeing their own change missing. Handle that explicitly (optimistic UI, or read from the write model right after a write) rather than pretending the consistency is immediate.
