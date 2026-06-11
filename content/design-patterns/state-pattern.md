---
title: State pattern
description: Letting an object change its behavior when its internal state changes.
tags:
  - design-patterns
---

The **state** pattern lets an object alter its behavior when its internal state changes, so it appears to change class at runtime.

Each state is a separate object that implements the same interface, and the context delegates to its current state. Transitions swap one state object for another.

Use it to replace sprawling conditionals that branch on a status field, such as an order moving through pending, paid, shipped, and delivered.

The tradeoff is more classes and indirection, worthwhile only when behavior genuinely differs per state.

It is closely related to [[strategy|Strategy]]: both delegate to interchangeable objects, but state objects also drive their own transitions.
