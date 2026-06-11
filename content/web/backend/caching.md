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
