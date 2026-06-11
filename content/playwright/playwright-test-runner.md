---
title: Playwright Test
description: Playwright's built-in test runner for browser tests.
tags:
  - playwright
  - testing
---

**Playwright Test** is Playwright's built-in test runner. It provides `test`, `expect`, fixtures, parallel execution, retries, reports, traces, and browser projects.

```js
test("can search products", async ({ page }) => {
  await page.goto("/products")
  await page.getByRole("textbox", { name: "Search" }).fill("book")
  await expect(page.getByText("JavaScript Book")).toBeVisible()
})
```

The runner supplies a fresh [[playwright-page|page]] fixture by default, so each test starts with isolated browser state.

Use Playwright Test for browser workflows. Use plain Playwright APIs directly when building automation scripts instead of tests.
