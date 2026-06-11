---
title: Throughput vs latency
description: How request rate and response time relate through concurrency and queueing.
tags:
  - performance
  - latency
  - capacity
---

**Throughput** is how many requests a system completes per second; **latency** is how long each one takes. They are linked but not the same — a system can be high-throughput and slow, or low-throughput and fast.

## How it works

Little's Law ties them together: `L = λ × W`, where `L` is the average number of requests in the system, `λ` is arrival rate (throughput), and `W` is average latency. Rearranged, concurrency equals throughput times latency. To push more requests through, you either lower per-request latency or allow more in flight.

```text
in-flight requests = throughput × latency
```

## The knee

As load rises, latency stays roughly flat while there is spare capacity, then climbs sharply once a resource saturates — the "knee" of the curve. Past saturation, queues build and latency grows without throughput improving; you are now trading latency for nothing. The useful operating point sits just below the knee.

## Pitfalls

Measuring throughput without watching latency hides this. A benchmark reporting "10k req/s" is meaningless if p99 latency was 8 seconds because requests were piling up in a queue. Always report both, and watch where queueing happens — thread pools, connection pools, the DB, the event loop.

Backpressure ([[../architecture/backpressure|backpressure]]) keeps a system near the knee by refusing or slowing intake before queues explode. See also [[latency-percentiles|latency percentiles]], [[../architecture/load-balancing|load balancing]] across the fleet, and [[../sre/capacity-planning|capacity planning]] for picking headroom.
