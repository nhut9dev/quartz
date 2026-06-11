---
title: APM
description: Application performance monitoring that ties metrics, traces, and spans to code.
tags:
  - performance
  - observability
  - monitoring
---

**APM** (application performance monitoring) instruments a running service to capture metrics, distributed traces, and spans, so you can see not just *that* it is slow but *where* and *why*.

## What it gives over logs

Logs tell you discrete events; APM tells you the shape of a request as it crosses services. A distributed trace stitches together the spans of one request — API gateway, service call, DB query, cache lookup — into a timeline, so a slow checkout becomes "the trace shows 400ms in a single N+1 query". That causal, cross-service view is what raw logs and standalone [[../observability/metrics|metrics]] cannot give you.

## How it works

An agent or SDK propagates a trace context across service boundaries (today usually via [[../observability/opentelemetry|OpenTelemetry]]) and records spans with timing and attributes. Aggregated, those spans produce the [[../observability/red-metrics|RED metrics]] and [[../sre/golden-signals|golden signals]] you alert on; individually, they let you open one slow [[../observability/tracing|trace]] and drill in.

## Tradeoffs

Tracing every request is expensive in overhead and storage, so APM samples — head-based (decide up front) or tail-based (keep the slow and failed ones). Sampling means a specific slow request may not have a trace, which is the cost of keeping overhead low. APM shows *which* span is slow; pair it with [[backend-profiling|profiling]] and [[flame-graph|flame graphs]] to find the line of code, and with [[../database/query-optimization|query optimization]] when the slow span is the database.
