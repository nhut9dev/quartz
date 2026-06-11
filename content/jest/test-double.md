---
title: Test double
description: A replacement object used in tests instead of a real dependency.
tags:
  - testing
  - jest
---

A **test double** replaces a real dependency during a test.

Common forms include dummy objects, fakes, stubs, spies, and mocks.

Test doubles can make tests faster and more focused, but too many mocks can couple tests to implementation details.

Use a test double when the real dependency is slow, unreliable, external, or not relevant to the behavior under test.
