---
title: Mock function
description: A test replacement function that records how it was called.
tags:
  - jest
  - testing
  - mock
---

A **mock function** replaces a real function during a test and records how it was called. In Jest, `jest.fn()` creates one.

```js
const sendEmail = jest.fn()

createUser({ email: "ada@example.com" }, sendEmail)

expect(sendEmail).toHaveBeenCalledWith("ada@example.com")
```

Mocks are useful when a test cares that collaboration happened, not that the real dependency ran.

Use mocks sparingly. If every dependency is mocked, the test may only prove that implementation details were called in the current order.
