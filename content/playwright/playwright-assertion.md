---
title: Assertion
description: A Playwright expectation that checks browser state.
tags:
  - playwright
  - testing
---

A **Playwright assertion** checks browser state through `expect`. Many assertions are web-first, meaning they wait for the expected condition before failing.

```js
await expect(page.getByRole("heading", { name: "Dashboard" })).toBeVisible()
await expect(page).toHaveURL(/dashboard/)
```

Assertions should describe what the user can observe: visible text, URL changes, enabled buttons, checked inputs, and accessible names.

Avoid asserting implementation details unless the detail is the behavior being tested.
