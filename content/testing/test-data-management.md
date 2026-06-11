---
title: Test data management
description: How tests create, isolate, and clean up the data they depend on.
tags:
  - testing
  - database
---

**Test data management** is the discipline of creating, isolating, and tearing down the data a test depends on so results stay deterministic and repeatable.

## How it works

Three common sources sit on a spectrum. **Fixtures** are static, pre-defined records loaded before a test. **Factories** build records programmatically with sensible defaults, overriding only the fields a test cares about. **Seed data** is a baseline dataset shared across many tests, often applied alongside [[../database/migration|migrations]].

Prefer factories for [[integration-test|integration tests]]: they keep each test's intent explicit and avoid brittle coupling to a shared fixture file.

## When to use

Anonymized production data is useful when realistic shapes and volumes matter, but it must be scrubbed of PII first and kept referentially intact.

## Pitfalls

Tests that share mutable data leak state into each other and become a source of [[flaky-test|flaky tests]]. Isolate by wrapping each test in a transaction and rolling back, or by truncating tables between runs.

Non-deterministic values like timestamps or random IDs also cause intermittent failures; freeze the clock and seed randomness so the same input always produces the same outcome.
