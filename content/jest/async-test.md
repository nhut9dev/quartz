---
title: Async test
description: A Jest test that waits for asynchronous work before asserting.
tags:
  - jest
  - testing
  - async
---

An **async test** waits for asynchronous work before checking the result. In Jest, the simplest form is an `async` test function with `await`.

```js
test("loads a user", async () => {
  const user = await loadUser("42")
  expect(user.name).toBe("Ada")
})
```

Jest waits for the returned [[promise|promise]] to settle. If the promise rejects, the test fails.

Avoid forgetting `await`. Without it, the test may finish before the assertion runs, creating a false pass.
