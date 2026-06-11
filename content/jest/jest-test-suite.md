---
title: Test suite
description: A group of related Jest test cases.
tags:
  - jest
  - testing
---

A **test suite** groups related [[jest-test-case|test cases]]. In Jest, `describe()` creates a suite.

```js
describe("formatName", () => {
  test("joins first and last name", () => {
    expect(formatName("Ada", "Lovelace")).toBe("Ada Lovelace")
  })
})
```

Suites are useful for grouping tests around one function, component, route, or module.

Do not over-nest suites. Deep `describe()` trees make the final test name hard to read and make setup harder to reason about.
