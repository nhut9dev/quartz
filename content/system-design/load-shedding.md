---
title: Load shedding
description: Intentionally rejecting work so a saturated system can keep serving the most important traffic.
tags:
  - system-design
  - reliability
---

**Load shedding** means refusing or dropping lower-priority requests when the system is already overloaded. The goal is to preserve latency and availability for traffic that still matters.

Use it when queues are growing, dependencies are timing out, or autoscaling cannot react fast enough. It usually pairs with [[rate-limiter|rate limiting]], [[../architecture/backpressure|backpressure]], and clear client retry behavior.

The hard part is deciding what to reject. Health checks, paid traffic, idempotent writes, and background jobs may deserve different treatment. A good load-shedding policy is explicit, measured, and visible in [[../observability/metrics|metrics]].
