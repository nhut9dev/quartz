---
title: Frontend feature flag
description: A runtime switch that changes frontend behavior without a new deployment.
tags:
  - product-engineering
  - frontend
  - deployment
---

A **frontend feature flag** changes UI behavior at runtime without shipping a new frontend build.

Flags are used for staged rollouts, experiments, permission-based features, kill switches, and separating deploy from release.

Frontend flags are visible to users, so they should not be treated as a security boundary. Sensitive authorization still belongs on the server.

Feature flags connect product rollout with [[../deployment/feature-flag|deployment feature flags]] and [[analytics-event-tracking|analytics event tracking]].
