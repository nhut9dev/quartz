---
title: Load testing
description: Driving synthetic traffic at a system to find its limits before users do.
tags:
  - performance
  - testing
  - reliability
---

**Load testing** generates synthetic traffic against a system to measure how latency and throughput behave under controlled, increasing load.

## Closed vs open model

This choice changes everything. A *closed* model has a fixed pool of virtual users who each wait for a response before sending the next request — so when the system slows, the load slows with it, which masks overload. An *open* model injects requests at a fixed arrival rate regardless of responses, which mirrors real internet traffic and exposes the knee honestly. Tools like k6 and Gatling support both; prefer open-model arrival rates for capacity work.

## Test shapes

- **Ramp** — slowly increase load to find the knee and saturation point.
- **Soak** — hold steady load for hours to surface leaks, fragmentation, and slow resource exhaustion.
- **Spike** — jump load instantly to test autoscaling and [[../architecture/backpressure|backpressure]].
- **Stress** — push past capacity to see how the system degrades and recovers.

## Pitfalls

Coordinated omission is the classic trap: a closed-model load generator stops issuing requests while the system is stalled, so the very slow responses are never recorded and the tail looks far better than reality. Open-model tooling or latency correction avoids it.

Test against production-like data and topology — a warm cache, an empty DB, or a single instance gives numbers that do not transfer. Watch [[latency-percentiles|percentiles]], [[throughput-vs-latency|throughput and the knee]], error rate, and saturation of pools and CPU together, and tie results back to your [[../observability/slo-sli|SLO/SLI]] and [[../sre/capacity-planning|capacity planning]].
