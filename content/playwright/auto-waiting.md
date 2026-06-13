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

## How it works

Before performing an action — click, fill, check — Playwright runs a series of **actionability checks** on the target: attached to the DOM, visible, stable (not mid-animation), enabled, and able to receive events (not covered by another element). It retries these checks until they all pass or the timeout elapses, then performs the action as a single atomic step.

## When to use

This happens automatically for every Playwright action. It matters most for interactions that follow an async state change — clicking a button that becomes enabled after a fetch resolves, or filling a field that appears after a modal finishes animating in.

## Trade-offs

Auto-waiting removes the need for manual `waitForTimeout()` calls in most cases, but it waits for *actionability*, not for your application's notion of "ready". An element can be visible, stable, and enabled while the data it displays is still loading — so actionability alone doesn't guarantee the page is in the state the test expects.

## Pitfalls

Relying on auto-waiting as a stand-in for asserting application state means a test can click a button the instant it's clickable, before the data behind it has loaded — producing a flaky failure one step later that looks unrelated to the real cause. The fix is pairing actions with [[web-first-assertion|web-first assertions]] on the state that actually matters, not just on element readiness.
