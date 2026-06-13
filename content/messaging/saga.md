---
title: Saga
description: A pattern for coordinating a long-running business process across services.
tags:
  - messaging
  - architecture
---

A **saga** coordinates a business process that spans multiple services by breaking it into a sequence of local [[transaction|transactions]], each with a **compensating action** that undoes it if a later step fails.

It is the answer to a problem [[monolith-vs-microservices|microservices]] create: one ACID transaction cannot span several services and their separate databases.

## How it works

Each step commits locally and publishes an event or sends a command that triggers the next step. There is no global lock and no rollback across services — instead, failure is handled forward by *compensation*. If step 3 fails, the saga runs the compensating actions for steps 2 and 1 in reverse (release the inventory, refund the payment), bringing the system back to a consistent state semantically rather than by rewinding.

```txt
reserve inventory → charge payment → confirm shipment
   compensate:        compensate:
   release stock      refund
```

## Choreography vs orchestration

The two coordination styles are the main design decision:

- **Choreography** — each service listens for the previous step's event and reacts, with no central coordinator. Simple to start and decoupled, but the overall flow is *implicit*: it exists only as the sum of who-reacts-to-what, scattered across services.
- **Orchestration** — a central saga orchestrator explicitly drives each step and tracks progress. More moving parts and a coordinator to run, but the workflow lives in one readable, debuggable place.

Choreography suits short, stable chains; orchestration earns its weight as the number of steps and branches grows.

## When to use

Use a saga for a multi-step business process that must span service boundaries and can tolerate brief inconsistency between steps — checkout, order fulfillment, booking a trip across flight/hotel/car. Prefer orchestration when the flow is complex or needs visibility; choreography when it's a short, stable chain of reactions.

## Trade-offs

You trade ACID atomicity for availability and service autonomy. The price is [[eventual-consistency|eventual consistency]] (the system is observably mid-process for a while) and the burden of designing a correct compensating action for every step — which is real domain work, not boilerplate.

## Pitfalls

Some actions can't be cleanly compensated: you can refund a payment, but you can't un-send an email — those steps belong at the end, after everything reversible has succeeded. Steps and compensations both run over an [[at-least-once-delivery|at-least-once]] channel, so each must be [[idempotent-consumer|idempotent]] or a retry double-charges. And a compensation can itself fail, so it needs its own retries and an escalation path — a saga stuck half-compensated is worse than one that never started.
