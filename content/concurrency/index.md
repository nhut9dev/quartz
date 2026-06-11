---
title: Concurrency
description: Application-level primitives for coordinating concurrent work and tuning how much runs at once.
tags:
  - concurrency
  - performance
---

These notes cover the **application-level building blocks** for running work concurrently without corrupting shared state or overwhelming downstream systems. They focus on the primitives and the tuning knobs, which sit a layer above OS threads and Node's [[../node/worker-threads|worker threads]].

- [[mutex|Mutex]] — mutual exclusion around a critical section
- [[semaphore|Semaphore]] — bounding how many things run at once
- [[thread-pool|Thread pool]] — a bounded set of reusable workers
- [[connection-pool-tuning|Connection pool tuning]] — sizing DB/HTTP pools under load
- [[race-condition|Race condition]] — what goes wrong without coordination
