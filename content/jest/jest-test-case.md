---
title: Test case
description: One executable example of expected behavior.
tags:
  - jest
  - testing
---

A **test case** is one executable example of expected behavior. In Jest, `test()` or `it()` defines the case.

```js
test("formats a full name", () => {
  expect(formatName("Ada", "Lovelace")).toBe("Ada Lovelace")
})
```

A good test case has a clear name, a small setup, one behavior under test, and assertions that explain the expected result.

If a test needs several unrelated assertions, it may be hiding multiple behaviors and should often become multiple test cases.
