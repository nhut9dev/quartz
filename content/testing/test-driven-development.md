---
title: Test-driven development
description: Writing a failing test before the code that makes it pass.
tags:
  - testing
---

**Test-driven development** (TDD) is a workflow where you write a failing test before writing the code that satisfies it.

The cycle is red, green, refactor: write a test that fails (red), write the simplest code to pass it (green), then clean up the design while tests stay green.

Starting from the test forces you to define behavior and a usable interface before implementation.

It tends to produce focused units, high coverage, and a safety net for refactoring.

The cost is discipline and slower initial progress. See [[../react/testing|React testing]] for applying TDD to components.
