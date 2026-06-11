---
title: HTTP
description: The request/response protocol of the web.
tags:
  - web
  - http
---

**HTTP** is the request/response protocol of the web. A client sends a request and the server returns a response; that simple, text-based shape is what underpins [[rest|REST]] and most web APIs, making them easy to inspect, cache, and debug.

```http
GET /articles/42 HTTP/1.1
Host: example.com
Accept: application/json

HTTP/1.1 200 OK
Content-Type: application/json

{"id":42,"title":"HTTP"}
```

## Anatomy

A request is a [[http-methods|method]], a URL, [[http-headers|headers]], and an optional body. A response is a [[http-status-codes|status code]], headers, and a body. Headers carry the metadata that makes the protocol flexible — content type, auth, caching directives, compression — while the method states intent and the status code states outcome.

## Statelessness

HTTP is stateless: each request is independent and carries everything needed to handle it, so the server keeps no memory of earlier requests on its own. That's what lets requests be load-balanced across servers and cached freely. "Stateless" is server-side, though — features like login depend on state the *client* carries on each request, via a [[cookie|cookie]], bearer token, or API key.

## Pitfalls

Treating a connection as if it remembers context breaks the moment a request lands on a different server. Methods have semantics worth honoring — `GET` should be safe and [[idempotency|idempotent]], `POST` is neither — and proxies and caches rely on that. Not setting cache headers leaves performance on the table; [[caching|caching]] is built almost entirely on HTTP metadata. HTTPS is the same protocol secured with [[tls|TLS]], and is now the baseline expectation.
