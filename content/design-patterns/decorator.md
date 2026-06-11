---
title: Decorator
description: Wrapping an object to add behavior dynamically without changing its class.
tags:
  - design-patterns
---

The **decorator** pattern wraps an object inside another object that shares the same interface, adding behavior without modifying the original class.

Each decorator forwards calls to the wrapped object and layers extra work before or after. Because they share an interface, decorators can be stacked freely.

Use it when subclassing would explode into many combinations, or when behavior should be composed at runtime rather than fixed at compile time.

Unlike inheritance, decoration is additive and reversible. The tradeoff is many small wrapper objects and indirection that can be hard to trace.

It resembles a [[proxy-pattern|proxy]] in structure, but a proxy controls access while a decorator enriches behavior. Compare with [[adapter|Adapter]], which changes an interface instead of extending it.
