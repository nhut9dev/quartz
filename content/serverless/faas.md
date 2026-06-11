---
title: FaaS
description: A serverless model where the provider runs and scales individual functions per request.
tags:
  - serverless
  - faas
---

**Functions as a Service** lets you deploy single functions that the provider runs and scales per request.

## How it works

You upload a stateless function bound to an event trigger (HTTP request, queue message, file upload, schedule). The provider spins up instances on demand, scales them out as traffic grows, and scales to zero when idle. You pay per invocation and runtime, not for always-on machines.

## When to use

Good for event-driven and bursty workloads: webhooks, API endpoints, scheduled jobs, and glue between services. Because it scales to zero and out automatically, it suits spiky traffic where running idle servers would waste money. This is [[../architecture/horizontal-vertical-scaling|horizontal scaling]] handled by the platform.

## Tradeoffs

Unlike containers or VMs, you give up control of the runtime in exchange for zero operations. The costs: vendor lock-in around triggers and packaging, hard limits on execution time and memory, statelessness that pushes state to external stores, and [[cold-start|cold starts]] on the first request to a fresh instance. For latency-critical edge work, see [[edge-function|edge functions]].
