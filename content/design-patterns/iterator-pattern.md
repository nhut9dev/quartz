---
title: Iterator pattern
description: Sequential access to elements without exposing the underlying structure.
tags:
  - design-patterns
---

The **iterator** pattern provides a standard way to walk through a collection's elements one at a time without revealing how the collection stores them.

The iterator holds the traversal state and exposes a simple `next()` step, so the same loop works whether the data lives in an array, tree, or linked list.

Use it to decouple iteration logic from container internals and to offer several traversal strategies over the same structure.

The tradeoff is extra objects, often unnecessary when a language already supports iteration natively.

JavaScript builds this in: see the [[../javascript/iterator|iterator protocol]], which `for...of` and the spread operator rely on.
