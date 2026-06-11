---
title: Race condition
description: A bug where the result depends on the unpredictable timing of concurrent operations.
tags:
  - concurrency
  - correctness
---

A **race condition** is a bug where the outcome depends on the *interleaving* of concurrent operations on shared mutable state, so it works most of the time and corrupts data occasionally.

## How it works

Two operations interleave in an order the author didn't expect. The classic case is a *check-then-act* or read-modify-write on shared state: two threads both read a counter as 10, both add 1, and both write 11 — one increment is silently lost. This *lost update* happens because the read and write weren't atomic.

```text
T1: read 10 ........... write 11
T2: ...... read 10 .... ......... write 11   // expected 12
```

## When to use

The fix depends on the source. Guard the critical section with a [[mutex|Mutex]] so the read-modify-write is atomic. Use atomic operations (compare-and-swap, atomic increment) for simple cases. Remove the shared mutable state entirely via immutability or a *single-writer* design, where only one thread ever mutates a given piece of state.

## Tradeoffs

The same problem and fixes appear at the database layer. [[../database/optimistic-locking|Optimistic locking]] detects the lost update via a version check instead of blocking, and the database's [[../database/isolation-level|Isolation level]] determines which interleavings the engine prevents for you. Choose locks for contended writes, optimistic checks for rare conflicts.
