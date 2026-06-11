---
title: Flaky test
description: A test that passes and fails nondeterministically without code changes.
tags:
  - testing
---

A **flaky test** passes sometimes and fails other times on the same code, with no change between runs.

Common causes are timing and async issues, like waiting on a fixed delay instead of a real condition, shared state that leaks between tests, and test-order dependence.

Flakiness is corrosive: it trains the team to ignore red builds, which hides genuine failures.

The fix is to find the source of nondeterminism, not to add retries. Retries mask the problem and let it spread.

Flakiness is most common in [[end-to-end-test|end-to-end tests]], which is one reason to keep them few.
