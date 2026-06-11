---
title: Matcher
description: A Jest method that compares a received value with an expectation.
tags:
  - jest
  - testing
---

A **matcher** is the method chained after [[jest-expect|expect]]. It decides how the received value should be compared.

```js
expect(total).toBe(42)
expect(user).toEqual({ id: 1, name: "Ada" })
expect(fetchUser()).resolves.toMatchObject({ id: 1 })
```

Use `toBe` for primitive identity, `toEqual` for deep object comparison, and `toMatchObject` when only part of an object matters.

Choosing the right matcher keeps failures useful. A broad matcher can let bugs pass, while an overly strict matcher can make tests fragile.
