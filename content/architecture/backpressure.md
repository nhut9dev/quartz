---
title: Backpressure
description: Slowing producers down when consumers cannot keep up.
tags:
  - architecture
  - performance
---

**Backpressure** is a way for a slow consumer to tell a fast producer to send less work.

Without backpressure, queues grow, memory rises, latency increases, and failures can spread through the system.

Backpressure can appear in [[../node/node-stream|streams]], [[../messaging/message-queue|message queues]], APIs, batch jobs, and event pipelines.

Common controls include rate limits, bounded queues, retry budgets, load shedding, and explicit flow-control signals.
