---
title: Backpressure
description: Slowing producers down when consumers cannot keep up.
tags:
  - architecture
  - performance
---

**Backpressure** is the signal and mechanism by which a slow consumer tells a fast producer to send less, so that a throughput mismatch becomes controlled slowdown instead of unbounded buildup.

## How it works

When a producer outpaces a consumer, the excess has to go *somewhere*. Without backpressure that somewhere is an unbounded buffer — an in-memory queue, a socket backlog — which grows until memory is exhausted and the process dies, often taking in-flight work with it. Backpressure replaces "buffer infinitely" with "push the limit back upstream": the buffer is bounded, and once it's full the producer is forced to slow down, block, or shed load rather than enqueue more.

The signal propagates *backwards* through the pipeline. A slow database makes the service writing to it slow, which fills the service's input queue, which signals the upstream caller to ease off — so the pressure travels from the true bottleneck back toward the source, instead of each stage silently absorbing it until something bursts.

## Mechanisms

- **Bounded queues** — a fixed-size buffer that blocks or rejects when full, turning "infinite backlog" into an explicit limit.
- **Pull-based flow** — the consumer requests N items when ready (reactive streams, [[../node/node-stream|Node streams]]' `pause`/`resume`), so the producer can't outrun it by construction.
- **[[rate-limiting|Rate limiting]] and retry budgets** — cap how fast work enters and how much retry traffic is allowed.
- **[[../system-design/load-shedding|Load shedding]]** — drop or reject low-priority work early when overloaded, trading completeness for survival.

## Pitfalls

The anti-pattern is an unbounded queue that *looks* like it's coping — latency climbs invisibly as the backlog grows, until memory runs out and the failure is sudden and total. Retries make it worse: under overload, naive retries add load exactly when the system has least to spare, amplifying the pileup ([[retry|retry]] needs backoff and a budget). And backpressure that only blocks, with no shedding, can deadlock a whole pipeline on one stuck stage — at some point refusing work is healthier than queuing it. It shows up across [[../node/node-stream|streams]], [[../messaging/message-queue|message queues]], APIs, and event pipelines.
