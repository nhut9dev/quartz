---
title: Rate limiting
description: Capping how many requests a client may make in a time window to protect a server.
tags:
  - web
  - api
  - performance
---

**Rate limiting** caps how many requests a client may make in a time window, protecting a server from overload or abuse. Limits are usually keyed by API key or IP — say 100 requests per minute — and tracked on the server side.

When a client exceeds the limit, the server returns a `429 Too Many Requests` [[http-status-codes|status]] together with a `Retry-After` [[http-headers|header]] saying how long to wait before trying again, which works well with [[idempotency|idempotent]] retries. Think of it as the server-side cousin of client [[throttle|throttling]]: throttling restrains how often you send, rate limiting enforces how often the server will accept.

```http
HTTP/1.1 429 Too Many Requests
Retry-After: 60
```

Good APIs make limits visible with headers such as remaining quota and reset time. That lets clients slow down before they hit the hard limit.

Rate limiting is not only for hostile traffic. It also protects shared systems from accidental loops, broken clients, expensive searches, and sudden bursts after an outage.
