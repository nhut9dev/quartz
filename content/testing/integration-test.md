---
title: Integration test
description: A test that verifies multiple units or modules working together.
tags:
  - testing
---

An **integration test** verifies that several units or modules work correctly together, rather than one piece in isolation.

It often involves real collaborators, such as an actual database, message queue, or HTTP service.

This catches bugs that [[testing/unit-test|unit tests]] miss: wrong assumptions about an interface, serialization mismatches, or broken wiring between layers.

The tradeoff is speed and setup. Integration tests run slower and need more infrastructure, so they sit in the middle of the [[testing/test-pyramid|test pyramid]].

For agreement across service boundaries without a full stack, see [[contract-testing|contract testing]].

## How it works

The test exercises a real boundary — an actual database connection, a real HTTP call, a real message queue — rather than substituting a [[testing/test-double|test double]] for it. "Real" here usually means a local or test-scoped instance (a test database, a containerized dependency via [[testcontainers|Testcontainers]]) rather than production infrastructure.

## When to use

Use integration tests for the seams between your code and something it doesn't fully control: an ORM query against a real schema, a serializer against a real message format, an HTTP client against a real (test) server — exactly the places where two individually-correct pieces fail when combined.

## Trade-offs

Real collaborators catch wiring bugs — wrong column types, serialization mismatches, missing migrations — that mocked unit tests structurally cannot, because the mock encodes the same (possibly wrong) assumption the code makes. The cost is setup: a database needs seeding and cleanup between runs, a test server needs to start and stop, and the whole suite runs slower than unit tests.

## Pitfalls

Shared state between integration tests is a common source of [[flaky-test|flakiness]] — if one test leaves a row in the database and the next assumes an empty table, their execution order now matters. Mocking too much *inside* an integration test — stubbing the very database call the test is supposedly exercising — quietly turns it back into a slow unit test, without gaining the wiring coverage that was the point.
