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

## How it works

`page.route()` registers a handler that intercepts matching requests before they reach the network. The handler can call `route.continue()` to let the real request proceed (optionally modified), `route.fulfill()` to respond directly without touching the network, or `route.abort()` to simulate a network failure. Multiple handlers can be registered and are checked in registration order.

## When to use

Use interception to make a test independent of a flaky or slow external service, to simulate error responses and edge cases that are hard to trigger for real — a `500`, a timeout, an empty result set — or to assert on outgoing requests, what the app actually sent, rather than just the resulting UI.

## Trade-offs

Mocking the network makes a test fast and deterministic regardless of backend state, but every mocked route becomes a second copy of that API's contract that can drift from the real one — the same general problem [[../testing/contract-testing|contract testing]] addresses at the service level.

## Pitfalls

Intercepting every request in an end-to-end test turns it into a test of your mocks rather than your app — at that point it's testing roughly the same thing a component test with [[../react/testing/msw|MSW]] would, at e2e cost. A route handler that matches more broadly than intended — a wildcard pattern catching requests it shouldn't — can silently mock away a request the test meant to let through, masking a real bug behind a fake response.
