---
title: Function composition
description: Combining small functions so the output of one becomes the input of the next.
tags:
  - functional-programming
---

**Function composition** combines small functions so the output of one becomes the input of the next.

Instead of one large procedure, you build a pipeline: `f(g(x))` applies `g`, then `f`. Helpers like `compose` or `pipe` chain many steps into a single function.

Composition rewards small, focused, [[pure-function|pure functions]]. Each piece does one thing, and you assemble behavior by wiring pieces together rather than nesting logic.

This makes code easier to read top to bottom, test in isolation, and rearrange.

The tradeoff is that deep pipelines can obscure intermediate values when debugging. Composition pairs naturally with [[../javascript/currying|currying]] and [[../javascript/higher-order-function|higher-order functions]].
