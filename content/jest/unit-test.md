---
title: Unit test
description: A test focused on a small piece of behavior in isolation.
tags:
  - jest
  - testing
---

A **unit test** checks a small piece of behavior, usually a function, class, component, or module.

```js
test("calculates tax", () => {
  expect(calculateTax(100, 0.1)).toBe(10)
})
```

Unit tests should be fast, focused, and easy to run often. They are best for business rules, transformations, edge cases, and pure [[function|functions]].

Isolation is useful, but not everything needs to be mocked. If two small modules are naturally used together, testing them together may be clearer.
