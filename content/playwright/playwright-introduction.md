---
title: Playwright
description: A browser automation framework for end-to-end web testing.
tags:
  - playwright
  - testing
---

**Playwright** is a browser automation framework for testing web apps in real browsers. It can drive Chromium, Firefox, and WebKit, click through UI, make assertions, capture traces, and run tests in parallel.

```js
import { test, expect } from "@playwright/test"

test("home page has a title", async ({ page }) => {
  await page.goto("/")
  await expect(page).toHaveTitle(/Home/)
})
```

Playwright is strongest for [[e2e-test|end-to-end tests]] and browser-level integration. It tests what a user can do, not only what a function returns.

Use [[jest-introduction|Jest]] for fast unit tests and Playwright when browser behavior, navigation, accessibility roles, or real rendering matters.
