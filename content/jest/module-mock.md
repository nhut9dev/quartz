---
title: Module mock
description: A Jest mock that replaces an imported module during a test.
tags:
  - jest
  - testing
  - mock
---

A **module mock** replaces an imported module with a fake implementation during a test.

```js
jest.mock("./mailer", () => ({
  sendEmail: jest.fn(),
}))
```

Module mocks are useful when code imports a dependency directly instead of receiving it as an argument.

They can also make tests more coupled to module structure. When possible, simple dependency injection with a [[jest-mock-function|mock function]] is easier to understand.
