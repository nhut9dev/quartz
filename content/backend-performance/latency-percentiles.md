---
title: Latency percentiles
description: A way to describe response time distributions so tail behavior is visible.
tags:
  - performance
  - observability
  - latency
---

A **latency percentile** describes the value below which a given fraction of requests fall — p99 means 99% of requests were faster than that number.

Percentiles exist because averages lie. A mean is dragged toward fast requests and hides the slow ones, yet the slow ones are what users feel. p50 (median) shows the typical experience, while p95, p99, and p999 expose the tail where retries, timeouts, and angry users live.

## Why the tail matters

Most users hit several services per page. With enough fan-out, a request's overall latency is dominated by the slowest dependency, so a "rare" p99 stall becomes a common end-to-end experience. Tail latency, not the average, defines perceived speed.

## Pitfalls

You cannot average percentiles. Taking the mean of per-minute p99 values, or averaging p99 across two servers, is statistically meaningless and usually understates the tail. Aggregate the raw distribution instead — typically with histograms (such as HDR histograms or Prometheus buckets) that can be merged before the percentile is computed.

Percentiles also need enough samples to be stable. A p999 over 200 requests is noise. And they hide multimodal behavior: a bimodal distribution (cache hit vs miss) can show a deceptively calm p50.

## Tradeoffs

Higher percentiles cost more to defend. Driving p999 down often means over-provisioning, hedged requests, or removing rare slow paths — work that may not be worth it. Pick the percentile your [[../observability/slo-sli|SLO/SLI]] actually promises and optimize for that. Percentiles pair naturally with [[../sre/golden-signals|golden signals]] and [[../observability/red-metrics|RED metrics]], and they are the unit you watch during [[load-testing|load testing]].
