---
title: Caching
description: Storing copies of data or responses so repeated requests are served faster.
tags:
  - web
  - performance
---

**Caching** is storing copies of data or responses so repeated requests are served faster instead of recomputed or refetched. It happens at many layers: the browser cache, HTTP cache headers that tell clients and proxies how long to reuse a response, the [[cdn|CDN]] cache at the edge, and server-side caches in memory or a shared store.

The core tradeoff is freshness versus speed. A longer cache serves faster but risks showing stale data, which is why cache invalidation, knowing when a cached copy is no longer valid, is famously the hard part.

Different strategies sit at different points on that tradeoff. [[isr|Incremental Static Regeneration]] caches a static page but rebuilds it on a schedule to stay reasonably fresh. In-memory [[memoization]] is caching at the function level, reusing a computed result for the same inputs within a single process.

```http
Cache-Control: public, max-age=31536000, immutable
```

That header fits fingerprinted static assets like `/app.8f3a.js`, where the URL changes when the content changes. For user-specific or sensitive responses, cache rules should be much stricter.

Good caching depends on stable keys. A cached response for `/products?page=2` is only safe to reuse for the same URL, relevant headers, and user context.

## How it works

A cache sits in front of the real computation or fetch and is checked first. The **cache key** is a function of the request — usually the URL plus whichever headers the response varies on (`Vary: Cookie`, `Vary: Accept-Language`) and any relevant user context. On a hit, the stored response is returned without touching the origin; on a miss, the origin is called and the result is stored under that key for next time, subject to a TTL or invalidation rule.

## When to use

Long, aggressive caching (`max-age=31536000, immutable`) fits content that's identical for everyone and changes only by changing its URL — fingerprinted assets. Shorter TTLs or **stale-while-revalidate** fit data that's mostly stable but occasionally updates, serving the cached copy immediately while refreshing it in the background. Anything per-user or sensitive should be `private` or not cached by shared caches at all.

## Trade-offs

Stale-while-revalidate gives consistently fast responses and eventual freshness, but means users can briefly see outdated data right after a change — acceptable for a product description, less so for an account balance. A short TTL keeps data fresher but means more requests reach the origin under load, reducing the caching benefit precisely when it matters most.

## Pitfalls

A **cache stampede** happens when a popular key expires and many concurrent requests all miss at once, each independently hitting the origin to repopulate the same key — turning one expiry into a burst of redundant load. An overly broad cache key — forgetting to vary on a cookie or auth header — can serve one user's personalized response to another, a serious correctness and privacy bug. And a write that should invalidate a cached read is easy to forget, leaving the cache serving stale data indefinitely until the TTL eventually expires.
