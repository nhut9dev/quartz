---
title: A/B testing
description: Comparing a control and a variant to make decisions from real user data.
tags:
  - product-management
  - metrics
---

**A/B testing** is a controlled experiment that splits users into a control group (the current version) and one or more variant groups (a change), then compares a target metric between them. It turns opinions into measured decisions.

Random assignment is what makes the comparison valid: with users split randomly, any difference in the metric can be attributed to the change rather than to who saw it.

Statistical *significance* tells you whether an observed difference is likely real or just noise. Running until you reach a pre-set sample size avoids the trap of peeking and stopping at a lucky moment.

Define one primary metric before you start, plus guardrail metrics so a win on one dimension doesn't quietly harm another. Chasing many metrics at once invites false positives.

A/B testing is how teams validate an [[mvp|MVP]] and optimize each stage of the [[aarrr-metrics|AARRR funnel]]. Roll variants out safely with a [[../deployment/feature-flag|feature flag]] and measure them via [[../product-engineering/analytics-event-tracking|analytics event tracking]].
