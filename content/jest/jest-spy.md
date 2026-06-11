---
title: Spy
description: A Jest wrapper that observes calls to an existing method.
tags:
  - jest
  - testing
  - mock
---

A **spy** observes calls to an existing object method. In Jest, `jest.spyOn()` wraps the method so the test can assert calls or replace behavior.

```js
const spy = jest.spyOn(console, "warn").mockImplementation(() => {})

warnIfDeprecated("old-api")

expect(spy).toHaveBeenCalled()
spy.mockRestore()
```

Use a spy when the real method already exists and the test needs to observe it. Use a [[jest-mock-function|mock function]] when you are injecting a fake dependency directly.

Restore spies after the test so later tests do not inherit modified global behavior.
