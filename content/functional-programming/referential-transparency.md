---
title: Referential transparency
description: When an expression can be replaced by its value without changing program behavior.
tags:
  - functional-programming
---

**Referential transparency** means an expression can be replaced by its resulting value without changing how the program behaves.

If `add(2, 3)` always equals `5`, you can swap one for the other anywhere. This holds only when functions are [[pure-function|pure]]: no hidden state, no side effects.

This property unlocks safe refactoring, memoization, and reasoning by substitution. The compiler, and your brain, can treat code like algebra.

Impure expressions break it: a value from `Date.now()` or a database read is not interchangeable with any fixed result.

It is the formal backbone behind [[function-composition|composition]] and [[../javascript/immutable-operation|immutable operations]].
