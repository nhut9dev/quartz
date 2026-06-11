---
title: Autoscaling
description: Automatically changing capacity based on demand or resource signals.
tags:
  - sre
  - deployment
  - performance
---

**Autoscaling** automatically changes service capacity based on demand or resource signals.

Common signals include CPU, memory, queue depth, request rate, latency, and custom business metrics.

Autoscaling helps absorb changing traffic, but it is not instant. Systems still need headroom, backpressure, rate limits, and graceful degradation.

Autoscaling interacts with [[../architecture/load-balancing|load balancing]], [[../architecture/backpressure|backpressure]], and deployment warm-up behavior.
