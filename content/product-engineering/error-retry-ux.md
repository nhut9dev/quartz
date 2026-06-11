---
title: Error retry UX
description: Designing recoverable error states with clear retry paths.
tags:
  - product-engineering
  - frontend
  - reliability
---

**Error retry UX** is the design of recoverable failures in the interface.

A useful error state says what failed, preserves user work when possible, and gives a safe next action such as retry, edit input, reconnect, or contact support.

Retries should avoid duplicate side effects. For writes, the backend may need [[../api-design/idempotency-key|idempotency keys]] so a repeated request does not create duplicate records.

## What good looks like

A good retry state keeps the user's context intact. Form values, table filters, scroll position, and selected files should not disappear just because a request failed.

Use different recovery paths for different failures. Validation errors need field-level guidance. Network failures need retry. Permission failures need a clear blocked state. Server failures may need retry plus support context.

## Retry safety

Retries are safest for reads and idempotent writes. For non-idempotent writes, the UI should avoid duplicate submissions and the API should support [[../api-design/idempotency-key|idempotency keys]].

Avoid infinite retry loops in visible UI. Use backoff, expose status honestly, and let users regain control.

## Implementation notes

Good retry UX depends on clear [[../api-design/error-response-format|error responses]], client-side state preservation, and observable failures on the server side. Pair it with [[loading-state|loading states]] and [[empty-state|empty states]] so every request outcome has a designed state.
