---
title: Frontend observability
description: Capturing client-side signals that explain real user failures and performance problems.
tags:
  - frontend-architecture
  - observability
  - performance
---

**Frontend observability** captures what users actually experience in the browser: errors, slow interactions, failed network calls, route transitions, and device or browser conditions.

Backend logs explain server behavior, but they cannot fully explain hydration failures, JavaScript crashes, blocked main threads, browser extensions, flaky networks, or CDN and asset issues.

## Signals

Useful client-side signals include uncaught errors, unhandled promise rejections, API failure rates, page load metrics, interaction latency, route changes, feature flag state, app version, and user or tenant identifiers that are safe to collect.

For privacy, avoid collecting raw form values, tokens, full URLs with secrets, or personally sensitive payloads.

## Debuggability

Every event should carry enough context to connect the browser session to backend traces: release version, environment, route, correlation ID when available, and the API request identifier.

Source maps should be uploaded securely for production releases so stack traces point back to useful source locations without exposing source maps publicly by accident.

## Pitfalls

Too many low-value events create noise and cost. Track the signals that help answer concrete questions: what broke, how many users were affected, which release introduced it, and whether a rollback or mitigation worked.

Related notes: [[../observability/structured-logging|Structured logging]], [[../observability/correlation-id|Correlation ID]], [[../frontend-performance/profiling|Profiling]], and [[../web/seo-performance/core-web-vitals|Core Web Vitals]].
