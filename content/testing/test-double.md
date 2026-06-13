---
title: Test double
description: An umbrella term for stand-in objects that replace real dependencies in tests.
tags:
  - testing
---

A **test double** is any object that stands in for a real dependency during a test, the way a stunt double replaces an actor.

The family has five members. A *dummy* is passed but never used. A *stub* returns canned answers. A *spy* records how it was called. A *mock* asserts on expected calls. A *fake* is a working but simplified implementation, like an in-memory database.

Doubles let [[testing/unit-test|unit tests]] stay fast and deterministic by removing slow or nondeterministic dependencies.

The gotcha: over-mocking couples tests to implementation details, so they break on harmless refactors instead of real bugs.

## How it works

Each double fixes a different problem with a real dependency. A *dummy* fills a required parameter the test doesn't care about. A *stub* returns a fixed value so the test can exercise a specific branch. A *spy* wraps a real or fake implementation and records how it was called, so the test can assert "this was called with X" afterward. A *mock* is a stub with built-in expectations — it fails the test itself if the expected calls don't happen. A *fake* is a simplified but functionally real implementation, like an in-memory list standing in for a database table.

## When to use

Reach for the simplest double that makes the test deterministic and fast: a stub when the test just needs a return value, a fake when the dependency's behavior — not just its output — matters across multiple calls, and a spy or mock only when the *interaction itself*, not just the result, is what's under test.

## Trade-offs

Doubles remove slow or nondeterministic dependencies, making [[testing/unit-test|unit tests]] fast and repeatable — but every double is a model of the real thing, and the test is only as good as that model. A stub that returns a shape the real dependency stopped returning months ago lets the test keep passing while the integration is broken.

## Pitfalls

Over-mocking — replacing every collaborator, even simple in-process objects — couples a test to the *current* implementation structure rather than its behavior, so a harmless refactor (renaming an internal helper, inlining a function) breaks tests that should have been unaffected. Mock-heavy tests can also pass while the real integration is broken, because the mock's behavior quietly drifted from the real dependency's; [[contract-testing|contract testing]] exists specifically to catch that drift at the boundary between services.
