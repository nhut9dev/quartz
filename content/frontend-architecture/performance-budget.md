---
title: Performance budget
description: Enforced limits on bundle size and key metrics to prevent regressions.
tags:
  - frontend-architecture
---

**A performance budget** is a set of agreed limits, on bundle size, request count, or timing metrics, that the app must stay under.

Budgets turn vague goals like "keep it fast" into concrete numbers a build can check automatically.

They commonly cap JavaScript bundle size and target thresholds for [[../web/core-web-vitals|Core Web Vitals]] such as LCP and INP.

When a change exceeds the budget, the build warns or fails, so regressions are caught before release rather than in production.

The benefit is sustained performance as the app grows. The tradeoff is friction: budgets need maintenance, and tactics like [[../web/code-splitting|code splitting]] are often required to stay within them.
