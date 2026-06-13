---
title: Monolith vs microservices
description: A comparison between one deployable application and many independently deployable services.
tags:
  - architecture
---

A **monolith** keeps most application behavior in one deployable unit; **microservices** split it into separate services that deploy and scale independently. The choice is less about code and more about how a team trades simplicity for independence.

## The core trade-off

A monolith's strength is simplicity: one codebase, one deploy, in-process calls that are fast and transactional, and easy local development. Its weakness shows at scale — as the code and the team grow, everything is coupled to one release, one runtime, and one shared database, so teams step on each other and the whole thing must be deployed and scaled as a unit.

Microservices invert both. Each service can be owned, deployed, scaled, and even written in a different language by a different team — real autonomy. The price is that every in-process call that crosses a service boundary becomes a *network* call: now fallible, slow, and outside any single transaction.

## What microservices add

The independence isn't free — it converts simple in-process concerns into distributed-systems problems:

- **Network boundaries** — calls fail and time out, demanding [[retry|retries]], [[timeout|timeouts]], and [[circuit-breaker|circuit breakers]].
- **Data consistency** — no cross-service transaction, so you live with [[eventual-consistency|eventual consistency]] and patterns like [[../messaging/saga|sagas]].
- **Operational overhead** — many deploys, service discovery, and distributed [[../observability/tracing|tracing]] to debug across services.
- **Communication** — often a [[message-queue|message queue]] to stay loosely coupled rather than chained synchronous calls.

## When to split

Start with the simplest architecture that fits — usually a (well-structured) monolith. Split when concrete pressure justifies the distributed cost: teams blocked on each other's releases, parts of the system with wildly different scaling needs, or domains that genuinely warrant independent ownership ([[domain-driven-design|bounded contexts]] are the natural seams). Splitting along the wrong boundaries gives you a **distributed monolith** — services that must deploy together — which carries every cost of microservices and none of the autonomy. Premature decomposition, before the boundaries are even understood, is the most expensive version of this mistake.
