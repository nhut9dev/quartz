---
title: Test pyramid
description: A model favoring many fast unit tests, fewer integration tests, and few end-to-end tests.
tags:
  - testing
---

The **test pyramid** is a heuristic for balancing test types: a wide base of [[testing/unit-test|unit tests]], a middle layer of [[testing/integration-test|integration tests]], and a narrow top of [[end-to-end-test|end-to-end tests]].

Tests near the base are fast, cheap, and deterministic, so you write many of them.

Tests near the top give the most confidence that the whole system works, but they are slow, costly, and more brittle.

The shape captures a tradeoff between speed and confidence. Inverting it into an "ice cream cone" of mostly e2e tests yields a slow, flaky suite.

Use the pyramid as a default, not a law.
