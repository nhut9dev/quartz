---
title: Bulkhead
description: Isolating resources so one failure does not consume the whole system.
tags:
  - architecture
---

A **bulkhead** limits how much damage one failing workload or dependency can cause.

Instead of sharing every thread, connection, queue, or worker pool, the system reserves separate capacity for different classes of work.

If one dependency becomes slow, its pool can fill up without blocking unrelated traffic.

Bulkheads are often paired with [[circuit-breaker|circuit breakers]], timeouts, and clear fallback behavior.
