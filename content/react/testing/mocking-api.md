---
title: Mocking API
description: Replacing real API calls with controlled responses during tests.
tags:
  - react
  - testing
  - api
---

**Mocking API** means replacing real network calls with controlled responses during tests.

API mocks make tests faster, more reliable, and independent from external services. They are useful for loading states, success states, errors, permissions, and retry behavior.

Mocks should match the real API contract closely. If mocks become too different from production behavior, tests can pass while the app is broken.
