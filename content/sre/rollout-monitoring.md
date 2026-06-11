---
title: Rollout monitoring
description: Watching system and product signals while a change is gradually released.
tags:
  - sre
  - deployment
---

**Rollout monitoring** checks whether a deploy, migration, or feature flag is harming users.

Useful signals include error rate, latency, saturation, business events, client errors, and support reports. The monitoring window should match the risk: a schema migration needs different checks than a CSS change.

Good rollout monitoring has an exit plan. Define the rollback trigger before the rollout starts. See [[../deployment/canary-deployment|Canary deployment]] and [[../deployment/rollback|Rollback]].
