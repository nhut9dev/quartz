---
title: Mocking API
description: Replacing real API calls with controlled responses during tests.
tags:
  - react
  - testing
  - api
---

**Mocking API** means replacing real network calls with controlled responses during tests.

API mocks make tests faster, more reliable, and independent from external services. They are useful for loading states, success states, errors, permissions, and retry behavior.

Mocks should match the real API contract closely. If mocks become too different from production behavior, tests can pass while the app is broken.

## How it works

The most durable place to mock is the network layer itself — intercepting the actual `fetch`/XHR request, as [[msw|MSW]] does — rather than mocking the function that calls fetch. A network-layer mock means the component's real data-fetching code, including error handling and headers, runs unchanged; only the response coming back is fake.

## When to use

Mock at the network layer for component and integration tests where you want to exercise the component's real data-fetching logic against controlled responses — loading states, error states, empty results, pagination. For a true [[../../testing/end-to-end-test|end-to-end test]], prefer a real backend or [[../../playwright/network-interception|Playwright's network interception]] instead of an in-app mock.

## Trade-offs

Mocking at the network layer costs more setup than mocking a data-fetching function directly — handlers need to match URLs and methods — but it means refactoring *how* data is fetched (swapping `fetch` for a different client, changing a hook's internals) doesn't break the tests, since the mock doesn't know or care how the request was made.

## Pitfalls

A mock that returns a shape the real API stopped returning — a renamed field, a changed status code for an error case — lets tests pass while the integration is broken, and that drift is invisible until a real request hits production. Mocking too high up — stubbing a custom `useUsers()` hook's return value directly — tests the component in isolation from its data layer entirely, which can hide bugs in how the hook itself handles loading, error, and empty states.
