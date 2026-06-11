---
title: Auto-waiting
description: Playwright's built-in waiting before actions and assertions.
tags:
  - playwright
  - testing
---

**Auto-waiting** means Playwright waits for elements to be actionable before interacting with them. It checks conditions like visibility, stability, enabled state, and whether an element can receive events.

```js
await page.getByRole("button", { name: "Save" }).click()
```

That click waits for the button to be ready instead of requiring a manual sleep.

Auto-waiting is one reason Playwright tests can be reliable without many `waitForTimeout()` calls. Prefer web-facing conditions and [[web-first-assertion|web-first assertions]] over fixed delays.
