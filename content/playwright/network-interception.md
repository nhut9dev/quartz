---
title: Network interception
description: Playwright APIs for observing, mocking, or changing network requests.
tags:
  - playwright
  - testing
---

**Network interception** lets Playwright observe, block, mock, or modify browser network requests.

```js
await page.route("**/api/user", route => {
  route.fulfill({ json: { name: "Ada" } })
})
```

It is useful when a test needs stable data, simulated errors, or control over slow external services.

Do not mock every request in an [[e2e-test|end-to-end test]] by default. Too much interception can turn a browser test into a test of mocks instead of the real app.
