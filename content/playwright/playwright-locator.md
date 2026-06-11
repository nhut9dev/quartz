---
title: Locator
description: A Playwright handle for finding and acting on page elements.
tags:
  - playwright
  - testing
---

A **Locator** describes how to find an element on the page. It waits for the element to be ready before actions and assertions.

```js
const submit = page.getByRole("button", { name: "Submit" })

await submit.click()
await expect(submit).toBeDisabled()
```

Locators are lazy. They do not immediately capture a DOM node; they resolve when Playwright performs an action or assertion.

Prefer locators that match how users understand the UI: role, label, placeholder, text, alt text, or test id.
