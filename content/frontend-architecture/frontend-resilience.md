---
title: Frontend resilience
description: Designing browser experiences that degrade gracefully under failures, latency, and partial outages.
tags:
  - frontend-architecture
  - reliability
  - product-engineering
---

**Frontend resilience** is the ability of an interface to remain understandable and recoverable when data, assets, APIs, authentication, or JavaScript execution fail.

A resilient frontend does not hide failures or trap users in broken states. It gives clear feedback, preserves user work when possible, and avoids making an outage worse with uncontrolled retries.

## Common techniques

Use route-level and component-level error boundaries, explicit loading and empty states, retry controls for recoverable failures, request cancellation for stale interactions, and offline-aware behavior when the product needs it.

For mutations, prefer idempotent backend operations and client-side retry policies that do not duplicate destructive actions.

## Failure boundaries

Not every error should crash the whole app. A failed recommendation panel can degrade independently, while a failed permission check or checkout submit may need to block the flow clearly.

## Pitfalls

Infinite spinners, automatic retry loops, and swallowed errors make incidents harder to diagnose. Resilience requires observable failure states, not just prettier loading UI.

Related notes: [[error-state-design|Error state design]], [[error-handling-strategy|Error handling strategy]], [[../product-engineering/error-retry-ux|Error retry UX]], [[../react/error-boundary|Error boundary]], and [[../dom/abort-controller|AbortController]].
