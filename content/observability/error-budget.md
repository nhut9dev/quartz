---
title: Error budget
description: The amount of unreliability a service can spend before violating its reliability target.
tags:
  - observability
---

An **error budget** is the allowed gap between perfect reliability and the target reliability promised by an [[slo-sli|SLO]].

For example, a 99.9% availability target allows about 0.1% failed or unavailable time over the measurement window.

When the budget is healthy, teams can take more delivery risk. When it is nearly spent, reliability work should take priority.

## How it is used

Error budgets turn reliability into a shared operating decision. A healthy budget can justify faster releases. A fast burn can justify pausing risky changes, improving tests, fixing noisy dependencies, or tightening rollout checks.

The budget should be tied to user-visible [[slo-sli|SLIs]], not only infrastructure health. A server can be up while the checkout flow is broken.

## Common mistakes

Do not treat error budget as permission to ignore reliability until the budget is gone. Burn rate matters: spending a month of budget in one hour is an emergency even if the calendar window still has budget left.

Also avoid using too many unrelated SLOs for one service. If every internal metric has its own budget, teams lose the ability to make clear decisions.

## Related operations

An error budget becomes useful when paired with an [[../sre/error-budget-policy|error budget policy]], [[alerting|alerting]], and release practices such as [[../sre/rollout-monitoring|rollout monitoring]].
