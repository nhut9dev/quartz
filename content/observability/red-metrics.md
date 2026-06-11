---
title: RED metrics
description: "Request-oriented metrics: rate, errors, and duration."
tags:
  - observability
  - metrics
---

**RED metrics** are rate, errors, and duration.

They fit request-serving systems such as APIs, workers, and RPC services. Rate shows how much work arrives, errors show failed work, and duration shows latency experienced by callers.

RED metrics are useful for [[slo-sli|SLOs and SLIs]] because they connect directly to user-visible service behavior.
