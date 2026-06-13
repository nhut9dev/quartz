---
title: Fetch API
description: The browser API for making HTTP requests from JavaScript.
tags:
  - javascript
  - web
  - api
---

The **Fetch API** is the standard browser API for making [[http|HTTP]] requests. It returns a [[promise|promise]] that resolves to a `Response` object.

```js
const response = await fetch("/api/users")

if (!response.ok) {
  throw new Error("Request failed")
}

const users = await response.json()
```

`fetch` only rejects for network-level failures. A `404` or `500` response still resolves, so application code usually checks `response.ok` before reading the body.

## How it works

`fetch` returns a promise that settles as soon as the response *headers* arrive — the body is a `ReadableStream` you consume separately with `.json()`, `.text()`, `.blob()`, or by reading the stream directly. That stream can only be read **once**; calling `.json()` twice on the same `Response` throws. Cancellation is a separate mechanism: pass an `AbortController`'s `signal`, and calling `controller.abort()` rejects the in-flight `fetch` with an `AbortError`.

```js
const controller = new AbortController()
const timeout = setTimeout(() => controller.abort(), 5000)

const response = await fetch("/api/users", { signal: controller.signal })
clearTimeout(timeout)
```

## When to use

Use raw `fetch` for one-off requests, server-side code, or when building your own data layer. For UI data fetching, React apps usually wrap `fetch` with [[tanstack-query|TanStack Query]] or similar, because `fetch` itself has no caching, retries, deduplication, or built-in loading/error state — those are the problems a data-fetching library solves on top.

## Trade-offs

`fetch` trades convenience for being a thin, standards-based primitive: no automatic JSON parsing or stringifying, no request/response interceptors, no built-in timeout (you compose one from `AbortController` + `setTimeout`), and no upload progress events (`XMLHttpRequest` is still needed for that). In exchange, it's promise-based, available everywhere without a library, and composes cleanly with `async/await` and streaming.

## Pitfalls

The most common bug is treating any resolved promise as success — always check `response.ok` (or `response.status`) before parsing the body, since `fetch` resolves normally for `404`/`500` responses and only rejects on network errors (DNS failure, CORS block, offline). In React, an unaborted `fetch` that outlives its component can set state after unmount or let a stale, slower response overwrite a newer one ("race condition") — abort the request in a cleanup function, or let the data-fetching library handle it. CORS failures surface as an opaque `TypeError: Failed to fetch` with no status code, which makes them easy to misdiagnose as a network outage.
