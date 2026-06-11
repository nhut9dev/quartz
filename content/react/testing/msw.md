---
title: Mock Service Worker (MSW)
description: Intercepting requests at the network layer so tests exercise real data-fetching code.
tags:
  - react
  - testing
  - data-fetching
---

**Mock Service Worker (MSW)** intercepts outgoing HTTP requests at the network level and returns mock responses, instead of you stubbing `fetch` or `axios` inside each test.

The difference matters. When you mock the fetch function, the test never runs your real request code — headers, query building, error parsing, and retry logic all go untested. MSW lets the component issue a genuine request that travels through your actual data layer; only the network boundary is faked. That makes the test close to production behaviour while staying fast and deterministic.

You define request handlers once and reuse them everywhere: unit tests, integration tests, Storybook, and local development.

```js
import { http, HttpResponse } from "msw"

export const handlers = [
  http.get("/api/user", () => HttpResponse.json({ name: "Ada" })),
]
```

In the browser it runs as a real Service Worker; in Node (Jest, Vitest) it patches the request modules. It pairs naturally with [[../data-fetching/tanstack-query|TanStack Query]] and replaces brittle per-test [[mocking-api|API mocks]] in [[component-test|component tests]].
