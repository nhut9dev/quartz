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

## How it works

`expect(locator).toBeVisible()` doesn't read the DOM once — it polls the locator repeatedly, re-querying the page, until the condition holds or the timeout (default 5s) elapses. Each retry re-evaluates the locator from scratch, so it tolerates elements that don't exist yet, re-render, or move.

## When to use

Use web-first assertions for anything that depends on the browser settling — text appearing after a fetch, a class toggling after a click, an element being removed after a dismiss action. For values that are already final and synchronous — a return value from a helper function, a computed constant — a plain one-shot `expect(value).toBe(...)` is more direct.

## Trade-offs

The retry behavior makes tests resilient to normal async timing without manual waits, but it also means a failing assertion takes the *full timeout* to report failure — a typo'd selector that will never match doesn't fail fast, it fails slow, after retrying for the default timeout.

## Pitfalls

A long timeout can mask a real race condition: if the UI briefly shows wrong data before settling into the right state, a web-first assertion that eventually matches the right state reports success — even though a user interacting at normal speed would have seen the wrong state first. And mixing a one-shot read (`const text = await locator.textContent()`) with a separate assertion on that value defeats the retry mechanism entirely — the read happens once, immediately, with no waiting at all.
