---
title: Test pyramid
description: A testing model that favors many focused tests and fewer expensive end-to-end tests.
tags:
  - testing
  - jest
---

The **test pyramid** suggests having many fast unit tests, fewer integration tests, and even fewer end-to-end tests.

The goal is fast feedback without losing confidence in real user workflows.

Unit tests are cheap but narrow. End-to-end tests cover more behavior but are slower and more fragile.

A healthy test suite balances these layers instead of trying to prove everything through [[../playwright/e2e-test|E2E tests]].
