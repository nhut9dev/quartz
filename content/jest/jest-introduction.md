---
title: Jest
description: A JavaScript test runner and assertion framework.
tags:
  - jest
  - testing
---

**Jest** is a JavaScript test runner with built-in assertions, mocks, snapshots, and coverage reporting. It runs tests in [[node-runtime|Node.js]] and is commonly used for functions, components, services, and API logic.

```js
test("adds two numbers", () => {
  expect(1 + 2).toBe(3)
})
```

Jest gives a project a standard place to define [[jest-test-case|test cases]], group them into [[jest-test-suite|test suites]], make assertions with [[jest-expect|expect]], and replace dependencies with [[jest-mock-function|mock functions]].

Use Jest when the important behavior can be tested without driving a real browser. For browser-level workflows, reach for [[playwright-introduction|Playwright]].
