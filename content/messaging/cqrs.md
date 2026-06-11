---
title: CQRS
description: Separating the model that handles writes from the model that serves reads.
tags:
  - messaging
---

**CQRS** (Command Query Responsibility Segregation) splits an application into a write model that handles commands and a separate read model that serves queries.

In a traditional design, one model handles both. CQRS recognizes that writes and reads often want different shapes: writes need validation and invariants, reads need fast, denormalized views.

By separating them, each side scales and is optimized independently. The read model can be a precomputed projection tuned for exactly the queries the UI needs.

The cost is added complexity and eventual consistency: the read model lags the write model by the time it takes events to propagate.

It frequently sits alongside [[event-sourcing|event sourcing]], where commands append events and projections build the read side. Both are common in [[event-driven|event-driven]] systems.
