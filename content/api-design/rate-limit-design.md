---
title: Rate limit design
description: Limiting request volume to protect an API and keep usage fair.
tags:
  - api
  - security
  - reliability
---

**Rate limit design** controls how many requests a client can make within a time window.

Rate limits protect APIs from abuse, accidental loops, expensive workloads, and noisy neighbors. They can be keyed by user, IP address, API key, route, tenant, or a combination.

Good responses include a clear status code, retry guidance, and enough headers for clients to back off correctly.

## Response contract

Use `429 Too Many Requests` when the caller exceeded an allowed quota. Include a machine-readable error code and, when possible, `Retry-After` or reset-time headers so clients can slow down without guessing.

Document whether limits apply per user, tenant, token, IP, endpoint, or organization. Hidden limits are hard for clients to design around and usually produce noisy support issues.

## Client behavior

Clients should back off, avoid tight retry loops, and distinguish rate limits from authentication or validation errors. If a write can be retried, combine rate limiting with [[idempotency-key|idempotency keys]].

## Trade-offs

Strict limits protect the platform but can block legitimate bursts. Loose limits improve user experience but may fail too late during abuse or outages. For important customers, consider separate quotas rather than manual exceptions that bypass protection entirely.

Rate limiting connects to [[../web/rate-limiting|rate limiting]], [[../security/dependency-security|security]], system-level [[../architecture/backpressure|backpressure]], and [[../system-design/rate-limiter|rate limiters]].
