---
title: Fixture
description: A Playwright test value prepared for each test.
tags:
  - playwright
  - testing
---

A **fixture** is a value Playwright prepares for a test. Built-in fixtures include `page`, `context`, `browser`, and `request`.

```js
test("opens settings", async ({ page }) => {
  await page.goto("/settings")
})
```

Fixtures make setup explicit through the test function parameters. Playwright creates and cleans them up according to fixture scope.

Custom fixtures can provide logged-in pages, seeded data, API clients, or page objects, but they should stay clear enough that tests remain readable.
