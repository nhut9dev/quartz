---
title: Declarative vs imperative
description: Describing what result you want versus spelling out each step to get it.
tags:
  - functional-programming
---

**Declarative** code describes *what* result you want; **imperative** code spells out *each step* to produce it.

An imperative loop manages an index, a counter, and mutation. A declarative `map` or `filter` states the transformation and hides the mechanics.

Declarative style tends to be shorter and closer to intent, so it reads like a description of the problem rather than the machine.

Imperative style gives finer control and can be faster in hot paths where you manage memory or short-circuit by hand.

Functional programming leans declarative, leaning on [[function-composition|composition]] and [[../javascript/higher-order-function|higher-order functions]] over manual loops.
