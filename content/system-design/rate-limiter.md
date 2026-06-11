---
title: Rate limiter
description: A component that decides whether a request should be allowed based on usage limits.
tags:
  - system-design
  - api
  - reliability
---

A **rate limiter** decides whether a request should be allowed based on configured usage limits.

Common algorithms include fixed window, sliding window, token bucket, and leaky bucket. Each trades off precision, burst handling, memory cost, and implementation complexity.

```js
// token bucket: refill over time, allow if a token is available
function allow(bucket, rate, capacity, now) {
  bucket.tokens = Math.min(capacity, bucket.tokens + (now - bucket.ts) * rate);
  bucket.ts = now;
  if (bucket.tokens < 1) return false;
  bucket.tokens -= 1;
  return true;
}
```

Rate limiters can run in-process for simple cases or use shared storage for distributed enforcement.

## When to use

Use a rate limiter when one client, tenant, route, or integration can consume more than its fair share of capacity. It protects expensive endpoints, login flows, public APIs, scraping targets, and dependencies that have their own limits.

For internal services, rate limiting is also a safety mechanism. It can stop accidental retry storms from turning one failure into a wider outage.

## Design choices

Choose the key carefully: IP address, user ID, API key, tenant, endpoint, or a composite key. IP limits are easy to evade or accidentally punish shared networks. User or tenant limits are usually fairer when identity is available.

Decide whether the limiter is local or distributed. Local limiters are fast and simple, but each instance enforces its own quota. Distributed limiters are more accurate across a fleet, but add network latency and a dependency such as [[../caching/redis|Redis]].

## Failure modes

Rate limiters should fail deliberately. Failing open protects availability but may allow overload. Failing closed protects capacity but can block legitimate traffic during limiter outages.

Good responses use `429 Too Many Requests`, include retry guidance, and avoid creating retry loops. They are a system-level implementation of [[../api-design/rate-limit-design|rate limit design]] and often pair with [[../architecture/backpressure|backpressure]] and [[load-shedding|load shedding]].
