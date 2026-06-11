---
title: Dashboard design
description: Designing operational dashboards that show service health and failure clues.
tags:
  - sre
  - observability
---

**Dashboard design** turns production signals into a readable view of service health.

Good dashboards start with user impact: availability, latency, error rate, saturation, and business-critical flows.

A useful dashboard helps answer whether the system is healthy, what changed, and where to investigate next. It should avoid noisy charts that no one uses during an incident.

Dashboard design builds on [[../observability/metrics|metrics]], [[../observability/tracing|tracing]], [[../observability/structured-logging|structured logging]], and [[../observability/slo-sli|SLOs and SLIs]].
