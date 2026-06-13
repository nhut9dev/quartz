---
title: Test pyramid
description: A model favoring many fast unit tests, fewer integration tests, and few end-to-end tests.
tags:
  - testing
---

The **test pyramid** is a heuristic for balancing test types: a wide base of [[testing/unit-test|unit tests]], a middle layer of [[testing/integration-test|integration tests]], and a narrow top of [[end-to-end-test|end-to-end tests]].

Tests near the base are fast, cheap, and deterministic, so you write many of them.

Tests near the top give the most confidence that the whole system works, but they are slow, costly, and more brittle.

The shape captures a tradeoff between speed and confidence. Inverting it into an "ice cream cone" of mostly e2e tests yields a slow, flaky suite.

Use the pyramid as a default, not a law.

## How it works

Each layer trades realism for speed and determinism. A unit test runs in milliseconds, touches no I/O, and points at exactly which function broke. An integration test exercises real wiring — a database, an HTTP client — and runs in seconds, with more setup and more ways to fail. An end-to-end test drives the actual UI through the real stack and runs in tens of seconds to minutes, with the most moving parts and the least precise failure signal.

## When to use

Use the shape as a planning heuristic for where a new test belongs: can this be verified with a pure function and a few inputs — write a [[testing/unit-test|unit test]]. Does it depend on how two real systems are wired together — write an [[testing/integration-test|integration test]]. Is it a critical user journey where only the full stack proves it works — add one [[end-to-end-test|end-to-end test]] for it, not several.

## Trade-offs

A pyramid-shaped suite gives fast feedback on most changes — the wide base runs on every save — while still validating real user flows through the narrow top in CI. Achieving that shape takes discipline: e2e tests are often the *easiest* to write for a new feature, since there's no mocking to design, even though they're the most expensive to keep passing over time.

## Pitfalls

The "ice cream cone" — few unit tests, heavy reliance on e2e — usually isn't a deliberate choice. It accretes when unit tests feel like they're "not testing the real thing", so teams keep adding e2e coverage to compensate without removing the underlying unit-level gap. The result is a slow, [[flaky-test|flaky]] suite where a single failure can take minutes to reproduce, and the root cause could be anywhere in the stack.
