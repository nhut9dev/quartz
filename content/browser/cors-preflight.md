---
title: CORS preflight
description: The browser's permission check before sending certain cross-origin requests.
tags:
  - browser
  - security
  - cors
---

A **CORS preflight** is an `OPTIONS` request sent before some cross-origin requests.

The browser uses it to ask whether the server allows the method, headers, and origin. If the preflight fails, the real request is not sent by the browser.

## How it works

A request is "simple" — and skips preflight — only if it's `GET`/`HEAD`/`POST` with no custom headers beyond a small allowed set and a body type of `text/plain`, form-encoded, or multipart. Anything else (a `PUT`/`DELETE`, a `Content-Type: application/json` body, an `Authorization` header) triggers the browser to first send an `OPTIONS` request asking "can the page at *this origin* send a `PUT` with header `Authorization`?" The server's response lists what it allows via `Access-Control-Allow-Methods`, `-Headers`, and `-Origin`; only if the actual request matches does the browser send it. The browser can cache that answer for `Access-Control-Max-Age` seconds, skipping the preflight on subsequent calls.

## When to use

This isn't something application code opts into — it's the browser's behavior for any cross-origin request. What you control is the *server's* CORS configuration (and, indirectly, whether your requests stay "simple"). Most real-world frontend-to-API calls (JSON bodies, auth headers) trigger preflights, so the practical question is making sure the server answers `OPTIONS` correctly rather than trying to avoid it.

## Trade-offs

A simple request (no custom headers, form-encoded body) avoids the extra round trip entirely — one request, one response. A JSON API with an `Authorization` header always pays for a preflight on the first call to an endpoint (then caches it per `Access-Control-Max-Age`). For latency-sensitive, high-frequency calls this matters; for typical app traffic the cached preflight makes it a non-issue after the first request.

## Pitfalls

The `OPTIONS` request never reaches your route's normal logic — many backend frameworks need explicit CORS middleware to answer it, and forgetting this surfaces in the browser as a generic CORS error that looks like an auth or network failure, not a "missing OPTIONS handler" error. `Access-Control-Allow-Origin: *` cannot be combined with `credentials: "include"` (cookies) — browsers reject the wildcard outright when credentials are involved, so cookie-authenticated cross-origin APIs must echo back a specific origin. And because [[../javascript/async/fetch-api|fetch]] surfaces CORS failures as an opaque `TypeError` with no status code, a failed preflight is easy to misdiagnose as "the server is down" when the server never even logged the request.
