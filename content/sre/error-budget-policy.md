---
title: Error budget policy
description: Rules for what a team does when reliability spending exceeds the agreed budget.
tags:
  - sre
  - reliability
---

An **error budget policy** turns [[../observability/error-budget|error budget]] from a metric into an operating rule.

The policy should define what happens when the budget is healthy, burning quickly, or exhausted. Common actions include slowing releases, prioritizing reliability work, tightening rollout checks, or pausing risky migrations.

The point is not to punish teams. It creates a shared trade-off between feature speed and user-visible reliability.
