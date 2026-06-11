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
