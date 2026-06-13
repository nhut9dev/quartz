---
title: Load shedding
description: Intentionally rejecting work so a saturated system can keep serving the most important traffic.
tags:
  - system-design
  - reliability
---

**Load shedding** is deliberately refusing or dropping lower-priority requests when a system is already overloaded, so that the traffic that still matters keeps its latency and availability instead of everything degrading together.

## How it works

An overloaded system that tries to serve *everything* serves everything badly: queues grow, latency climbs for all requests, and many time out after consuming resources — work done for nothing. Load shedding makes the opposite choice — fail some requests *fast and on purpose* so the rest succeed. It triggers on a saturation signal (queue depth, latency, CPU, in-flight count) and rejects excess requests immediately, typically with `503` and a `Retry-After`, before they consume capacity they won't get to use.

It's the partner of [[../architecture/backpressure|backpressure]]: backpressure pushes the limit upstream so producers slow down; shedding drops what still arrives beyond the limit. It also pairs with [[rate-limiter|rate limiting]] (per-client caps) and sane client [[../architecture/retry|retry]] behavior.

## What to shed

The hard part is *choosing*, because not all requests are equal. Health checks must survive (shedding them triggers a false failover). Paid or interactive user traffic usually outranks background jobs and batch work. Idempotent requests are safer to drop than ones mid-transaction. A good policy ranks traffic by priority explicitly and sheds from the bottom up, rather than dropping uniformly.

## Pitfalls

Shedding indiscriminately is worse than not shedding — drop the wrong thing (health checks, a payment's second step) and you cause an outage while trying to prevent one. **Retry storms** undo it: clients that immediately retry shed requests add load exactly when there's none to spare, so shedding only works with client backoff and a retry budget. And shedding that's invisible looks identical to an outage — the policy must be explicit, measured, and surfaced in [[../observability/metrics|metrics]], or you can't tell deliberate protection from real failure.
