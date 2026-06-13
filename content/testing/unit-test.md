---
title: Unit test
description: A test that verifies a single unit of code in isolation.
tags:
  - testing
---

A **unit test** verifies one small unit of code, such as a function or class, in isolation from the rest of the system.

Good unit tests are fast and deterministic, so you can run thousands in seconds.

External dependencies like databases, networks, or the clock are replaced with [[testing/test-double|test doubles]] to keep the unit isolated.

They form the wide base of the [[testing/test-pyramid|test pyramid]] and pinpoint exactly where logic broke.

The gotcha: isolation can hide bugs that only appear when real units interact, which is what [[testing/integration-test|integration tests]] catch.

## How it works

The test calls the unit directly — a function, a method, a component in isolation — with controlled inputs and asserts on the output or resulting state. Anything the unit depends on but doesn't own — a database, the network, the system clock, another module — is replaced with a [[testing/test-double|test double]], so the outcome depends only on the unit's own logic.

## When to use

Unit tests fit pure logic and business rules with clear inputs and outputs: tax calculations, validation rules, formatting, state transitions, edge cases like empty input or boundary values. They're the cheapest way to pin down exactly what a function should do for a given input.

## Trade-offs

Isolation makes unit tests fast and deterministic — thousands can run in seconds, and a failure points at one unit — but the same isolation means a unit test can pass while the system is broken, if the assumption it encodes about a dependency (via a test double) no longer matches that dependency's real behavior.

## Pitfalls

The most common failure is over-isolation: mocking dependencies that are cheap, deterministic, and reasonably part of the same module's scope, just because they're technically "external". This produces tests that assert on implementation details — which internal function called which other internal function — rather than observable behavior, so they break on harmless refactors. The bugs that slip through this way — wrong wiring, mismatched data shapes between modules — are exactly what [[testing/integration-test|integration tests]] exist to catch.
