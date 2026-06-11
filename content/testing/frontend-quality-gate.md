---
title: Frontend quality gate
description: A focused set of checks that catches common frontend regressions before release.
tags:
  - testing
  - frontend
  - release
---

A **frontend quality gate** is the minimum set of automated and manual checks a change should pass before it reaches users.

The goal is not to test everything. The goal is to catch likely regressions in behavior, accessibility, visual layout, performance, and integration points while the change is still cheap to fix.

## Typical checks

Use unit or component tests for state logic and component behavior, integration tests for connected flows, and end-to-end tests for critical user journeys.

Add accessibility checks for interactive components and key pages. Use visual regression tests for layouts where CSS regressions are common. Run type checking, linting, formatting, and build verification on every pull request.

## Release confidence

Critical flows should have smoke tests in the deployed environment, not only in mocked local tests. Feature flags and canary releases reduce blast radius when a UI change touches a high-traffic workflow.

## Pitfalls

A quality gate that is slow or flaky will be bypassed. Keep the fast checks close to the pull request and move broader checks to scheduled, pre-release, or canary workflows.

Related notes: [[test-pyramid|Test pyramid]], [[end-to-end-test|End-to-end test]], [[flaky-test|Flaky test]], [[../playwright/visual-regression-test|Visual regression test]], and [[../deployment/feature-flag|Feature flag]].
