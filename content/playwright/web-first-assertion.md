---
title: Web-first assertion
description: A Playwright assertion that waits for browser state to match.
tags:
  - playwright
  - testing
---

A **web-first assertion** waits for browser state to match the expectation before failing. This fits UI tests because rendering, navigation, and network work often finish asynchronously.

```js
await expect(page.getByText("Saved")).toBeVisible()
```

Playwright retries the assertion until it passes or times out. That is different from reading a value once and asserting immediately.

Use web-first assertions for UI state. They reduce flaky tests caused by racing the browser.
