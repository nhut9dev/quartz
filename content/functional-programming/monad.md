---
title: Monad
description: A structure for chaining computations that carry a context such as optionality or async.
tags:
  - functional-programming
---

A **monad** is a structure for chaining computations that each carry a context, like optionality, error, or asynchrony.

Beyond a [[functor|functor]]'s `map`, a monad adds a `flatMap` (or `chain`) that runs a function returning another wrapped value and flattens the result, avoiding nested containers.

Promises are the everyday example: `.then` chains async steps, automatically unwrapping each promise so you sequence work without manual nesting. An `Optional` or `Result` type chains computations that might be absent or fail.

The win is sequencing context-aware steps cleanly, short-circuiting on absence or error.

The tradeoff is a learning curve and abstraction that can feel heavy for simple cases.
