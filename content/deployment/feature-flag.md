---
title: Feature flag
description: A runtime switch that controls whether a feature or behavior is enabled.
tags:
  - deployment
  - architecture
---

A **feature flag** separates deploying code from releasing behavior.

Flags can enable gradual rollout, experiments, kill switches, tenant-specific access, and safer migrations.

The tradeoff is extra branching and cleanup work; stale flags make code harder to understand.

Feature flags pair well with [[canary-release|canary releases]] because rollout can change without building a new artifact.
