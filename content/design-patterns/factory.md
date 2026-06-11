---
title: Factory
description: A pattern that centralizes object creation behind a function or class.
tags:
  - design-patterns
---

A **factory** creates [[object|objects]] without forcing callers to know every construction detail. It is often implemented as a [[function|function]] or [[class|class]] that hides the chosen implementation.

Factories are useful when object creation depends on options, environment, feature flags, or multiple implementations.

They keep creation logic in one place while letting callers depend on a simpler interface.
