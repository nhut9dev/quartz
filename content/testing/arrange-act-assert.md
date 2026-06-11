---
title: Arrange-Act-Assert
description: A three-phase structure for writing clear, focused tests.
tags:
  - testing
---

**Arrange-Act-Assert** (AAA) is a convention for structuring a test in three distinct phases.

*Arrange* sets up the inputs, state, and any [[testing/test-double|test doubles]] the test needs.

*Act* performs the single action under test, usually one function call.

*Assert* checks that the outcome matches expectations.

Separating the phases keeps each test readable and focused on one behavior. When a test is hard to fit into AAA, it is often doing too much.

The same idea appears as "Given-When-Then" in behavior-driven testing.
