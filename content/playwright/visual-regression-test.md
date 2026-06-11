---
title: Visual regression test
description: A test that detects unintended visual changes in the UI.
tags:
  - testing
  - playwright
---

A **visual regression test** compares a UI screenshot against an approved baseline.

It catches layout shifts, missing styles, accidental spacing changes, and broken visual states that assertions may miss.

Visual tests are useful for design systems, critical flows, and components with complex responsive behavior.

They need stable data, fonts, viewport sizes, and animation control to avoid noisy failures.
