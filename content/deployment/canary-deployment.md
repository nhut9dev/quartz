---
title: Canary deployment
description: Releasing a new version to a small subset of users first, then widening if it stays healthy.
tags:
  - deployment
---

A **canary deployment** routes a small fraction of traffic to a new version, watches its behavior, and gradually shifts more traffic only if it stays healthy.

The name comes from the canary in a coal mine: a small early warning before committing everyone.

You start by sending, say, 5% of users to the new release while monitoring error rates and latency. If metrics hold, you widen to 25%, then 100%; if they degrade, you [[rollback|roll back]] having harmed only a sliver of users.

This limits blast radius and surfaces real-world problems that staging cannot. The cost is running two versions at once and needing solid metrics to judge health.

It contrasts with [[blue-green-deployment|blue-green deployment]], which switches all traffic instantly. See [[canary-release|canary release]] and [[feature-flag|feature flags]].
