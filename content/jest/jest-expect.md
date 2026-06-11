---
title: expect
description: Jest's assertion function for checking received values.
tags:
  - jest
  - testing
---

`expect` is Jest's assertion function. It wraps the value your code produced, then a [[jest-matcher|matcher]] checks that value against the expected result.

```js
expect(user.name).toBe("Ada")
expect(users).toHaveLength(3)
expect(response).toEqual({ ok: true })
```

Assertions are the point of a test: they turn a setup and action into a pass or failure.

Prefer assertions that describe behavior clearly. A test with no meaningful `expect` may only prove that code did not throw.
