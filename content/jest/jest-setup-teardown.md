---
title: Setup and teardown
description: Jest hooks that prepare and clean up test state.
tags:
  - jest
  - testing
---

**Setup and teardown** hooks prepare state before tests and clean it after tests. Jest provides `beforeEach`, `afterEach`, `beforeAll`, and `afterAll`.

```js
beforeEach(() => {
  database.reset()
})

afterEach(() => {
  jest.restoreAllMocks()
})
```

Use setup for repeated test preparation and teardown for cleanup that protects the next test.

Keep shared setup small. Hidden setup can make a [[jest-test-case|test case]] hard to read because the important inputs are far away from the assertion.
