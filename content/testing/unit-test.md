---
title: Unit test
description: A test that verifies a single unit of code in isolation.
tags:
  - testing
---

A **unit test** verifies one small unit of code, such as a function or class, in isolation from the rest of the system.

Good unit tests are fast and deterministic, so you can run thousands in seconds.

External dependencies like databases, networks, or the clock are replaced with [[testing/test-double|test doubles]] to keep the unit isolated.

They form the wide base of the [[testing/test-pyramid|test pyramid]] and pinpoint exactly where logic broke.

The gotcha: isolation can hide bugs that only appear when real units interact, which is what [[testing/integration-test|integration tests]] catch.
