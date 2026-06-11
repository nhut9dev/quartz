---
title: Cold start
description: The latency added when a function must initialize before it can serve a request.
tags:
  - serverless
  - performance
---

**Cold start** is the latency added when a function or instance must initialize before serving its first request.

## How it works

When no warm instance is available, the platform provisions a new container, boots the language runtime, and loads your code and dependencies before the handler runs. A subsequent request hitting that warm instance skips all of this and responds quickly. Cold starts mostly affect [[faas|FaaS]] workloads that have scaled to zero or are scaling out.

## Pitfalls

Several things make cold starts worse: large deployment bundles, many or heavy dependencies, attaching to a VPC (extra network setup), and slow-booting runtimes like the JVM. The effect shows up in tail latency, so watch your [[../backend-performance/latency-percentiles|latency percentiles]] rather than the average.

## Tradeoffs

Mitigations cost money or effort: provisioned concurrency keeps instances warm but you pay for idle capacity, keep-warm pings reduce cold starts cheaply but imperfectly, and shrinking bundles plus lighter runtimes lowers init time without ongoing cost.
