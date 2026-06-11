---
title: Alert fatigue
description: The loss of attention caused by too many noisy or low-value alerts.
tags:
  - observability
  - sre
---

**Alert fatigue** happens when alerts fire too often or do not require action.

Noisy alerts train people to ignore the paging system. That makes real incidents slower to detect and more stressful to handle.

Every alert should have an owner, user impact, threshold rationale, and runbook. If no one knows what to do when it fires, it should not page. Related: [[alerting|Alerting]] and [[../sre/on-call|On-call]].
