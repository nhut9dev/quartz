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

## How it works

`jest.mock()` calls are hoisted to the top of the file before any imports run, so by the time the test file's `import` statements execute, Jest has already substituted the mock into its module registry — any code that imports that module, including the code under test, receives the mock instead of the real implementation.

## When to use

Reach for a module mock when the code under test imports a dependency directly — a database client, a third-party SDK, the file system — and there's no easy way to substitute it via a parameter. If the code already accepts its dependencies as arguments or via a constructor, passing a plain [[jest-mock-function|mock function]] directly is simpler and doesn't rely on Jest's module-system hoisting.

## Trade-offs

Module mocking requires no changes to the source code's structure, which is useful for code you can't or don't want to refactor — but it ties the test to *how* the module is imported (the exact path, the exact export names), so renaming a file or changing an export from named to default breaks the mock even when the code's behavior is unchanged.

## Pitfalls

Because the hoisting happens automatically, a `jest.mock("./mailer")` call applies to the whole file regardless of where it appears textually — placing it after other code that also references `./mailer` can be surprising if you expect mock declarations to be order-sensitive. Partial mocks (`jest.requireActual` plus overriding one export) are easy to get subtly wrong, mocking more or less of the module than intended. And a module mock whose shape no longer matches the real module — a missing newly-added export, a changed return type — lets tests pass while the real integration is broken.
