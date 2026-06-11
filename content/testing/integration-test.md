---
title: Integration test
description: A test that verifies multiple units or modules working together.
tags:
  - testing
---

An **integration test** verifies that several units or modules work correctly together, rather than one piece in isolation.

It often involves real collaborators, such as an actual database, message queue, or HTTP service.

This catches bugs that [[testing/unit-test|unit tests]] miss: wrong assumptions about an interface, serialization mismatches, or broken wiring between layers.

The tradeoff is speed and setup. Integration tests run slower and need more infrastructure, so they sit in the middle of the [[testing/test-pyramid|test pyramid]].

For agreement across service boundaries without a full stack, see [[contract-testing|contract testing]].
