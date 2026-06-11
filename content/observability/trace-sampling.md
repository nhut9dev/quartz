---
title: Trace sampling
description: Choosing which distributed traces to keep for analysis.
tags:
  - observability
  - tracing
---

**Trace sampling** decides which traces are stored.

Head-based sampling chooses early, before the full result is known. Tail-based sampling chooses after seeing latency, errors, or other outcomes, which is often better for incident debugging.

Sampling should protect rare and important traces: slow requests, errors, high-value workflows, and new deployments.
