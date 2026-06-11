---
title: Page
description: Playwright's object for controlling one browser tab.
tags:
  - playwright
  - testing
---

A **Page** is Playwright's object for controlling one browser tab. It can navigate, click, type, read content, listen for events, and create [[playwright-locator|locators]].

```js
await page.goto("/login")
await page.getByLabel("Email").fill("ada@example.com")
await page.getByRole("button", { name: "Sign in" }).click()
```

In Playwright Test, `page` is usually provided as a [[playwright-fixture|fixture]].

Keep page-level code user-focused. Prefer role, label, text, and test-id locators over brittle CSS selectors that mirror implementation details.
