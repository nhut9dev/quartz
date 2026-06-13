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

## How it works

A test runner drives a real browser against a running instance of the app, which talks to real or test-scoped backend services and a database. The test interacts the way a user would — clicking, typing, waiting for the page to update — and asserts on what's visible, not on internal state.

## When to use

Reserve e2e tests for the handful of flows where the cost of being wrong is highest and only the full stack can prove correctness — sign-up, checkout, the core action the product exists to perform. Business logic that a [[testing/unit-test|unit test]] could check in milliseconds doesn't need an e2e test to verify it too.

## Trade-offs

An e2e test gives the strongest signal that "the feature works" because nothing is mocked — but that strength comes from depending on *everything*: UI, API, database, network, timing, and test environment all have to cooperate, which means far more ways for the test to fail for reasons unrelated to the feature itself.

## Pitfalls

E2e tests are the most common source of [[flaky-test|flaky tests]], precisely because they have the most timing-dependent moving parts — and a flaky e2e suite trains the team to re-run failures rather than investigate them. Debugging a failure is also harder than at lower layers: a red e2e test says *that* something broke in a multi-step flow, not *where*, which is why it's often paired with step-by-step tooling like [[../playwright/trace-viewer|trace viewer]].
