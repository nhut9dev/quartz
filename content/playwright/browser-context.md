---
title: Browser context
description: An isolated browser session in Playwright.
tags:
  - playwright
  - testing
---

A **browser context** is an isolated browser session. It has its own cookies, local storage, permissions, and pages.

```js
const context = await browser.newContext()
const page = await context.newPage()
```

Contexts are lighter than launching a whole browser and are useful for test isolation. Playwright Test usually gives each test a fresh context through fixtures.

Use separate contexts to model separate users, such as an admin and a customer interacting with the same app.
