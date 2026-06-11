---
title: End-to-end test
description: A test that exercises a complete user flow through the real system.
tags:
  - testing
---

An **end-to-end test** (e2e) drives a complete user flow through the real system, typically from a browser through the backend to the database.

It is the closest thing to a real user, so a passing e2e test gives high confidence that the feature actually works.

That confidence is expensive. E2e tests are slow to run and brittle, breaking on timing, layout changes, or flaky environments. See [[testing/flaky-test|flaky test]].

They sit at the narrow top of the [[testing/test-pyramid|test pyramid]]: write a few for critical paths, not for every edge case.

Tools like [[../playwright/|Playwright]] automate the browser side.
