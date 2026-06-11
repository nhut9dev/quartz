---
title: Flaky test
description: A test that sometimes passes and sometimes fails without a relevant code change.
tags:
  - testing
  - playwright
---

A **flaky test** gives inconsistent results without a meaningful product change.

Common causes include timing assumptions, shared state, network dependence, animation, order dependence, and brittle selectors.

Flaky tests reduce trust in the suite because failures stop meaning clearly broken behavior.

Tools like [[auto-waiting|auto-waiting]], user-facing [[playwright-locator|locators]], isolated test data, and trace debugging help reduce flakiness.
