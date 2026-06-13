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

## How it works

A **token bucket** holds a capacity of tokens that refill at a fixed rate; each request consumes one token, and requests are rejected once the bucket is empty — this naturally allows short bursts up to the bucket's capacity while enforcing a steady average rate. A **sliding window** counter tracks request timestamps over a rolling time range, giving a smoother limit than a fixed window that simply resets at a clock boundary.

## When to use

Per-key buckets (one per API key or user) give fair limits across clients; a global bucket protects a single expensive shared resource — a search endpoint, an export job — regardless of who's calling it. Fixed windows are the simplest to implement and are fine when occasional boundary bursts don't matter.

## Trade-offs

In-memory counters are fast and add no latency, but are per-instance — with multiple servers behind a load balancer, each instance enforces its own limit, so the effective global limit is the per-instance limit times the instance count. A centralized store (Redis) gives an accurate global limit but adds a network round trip and a dependency to every rate-limited request.

## Pitfalls

A fixed window has an edge-burst problem: a client can send a full quota right at the end of one window and another full quota immediately at the start of the next, achieving double the intended rate across the boundary. When many clients hit a limit at once and all get the same `Retry-After`, they tend to retry at the same moment — a thundering herd — so backoff should include jitter to spread retries out.
