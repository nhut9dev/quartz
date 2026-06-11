---
title: Capacity planning
description: Estimating the resources a system needs before traffic or workload growth causes failure.
tags:
  - sre
  - scalability
---

**Capacity planning** estimates how much CPU, memory, storage, network, and dependency capacity a service needs.

Start with current usage, expected growth, peak traffic shape, and known bottlenecks. Then add headroom for incidents, deploys, batch jobs, and traffic surprises.

Capacity planning is only useful when tied to measurement. Pair it with [[../observability/use-metrics|USE metrics]], [[autoscaling|autoscaling]], and load tests that resemble real traffic.
