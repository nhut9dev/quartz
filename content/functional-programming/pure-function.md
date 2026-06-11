---
title: Pure function
description: A function that always returns the same output for the same input and causes no side effects.
tags:
  - functional-programming
---

A **pure function** always returns the same output for the same input and causes no observable side effects.

It depends only on its arguments, never on hidden state, the clock, or random values. It also leaves the outside world untouched: no mutation, no I/O, no logging.

This predictability makes pure functions easy to test, cache, and reason about. You can call them anywhere and trust the result.

The tradeoff is that real programs must eventually do impure work. The pattern is to push side effects to the edges and keep a pure core.

See [[../react/purity|purity]] for how React relies on this, [[../react/side-effect|side effect]] for the impure counterpart, and [[referential-transparency|referential transparency]] for the property purity enables.
