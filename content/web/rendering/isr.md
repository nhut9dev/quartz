---
title: Incremental static regeneration
description: Static pages regenerate in the background after a revalidation interval, without a full rebuild.
tags:
  - web
  - rendering
---

**Incremental static regeneration (ISR)** extends [[ssg|static site generation]] by letting individual pages rebuild themselves in the background after a revalidation interval, instead of only at build time. The first visitor after the interval expires triggers a fresh render; everyone keeps getting the fast static file until the new one is ready.

This blends SSG's speed with fresher data. You still serve pre-built HTML from the edge, but a product page or article can pick up changes every few minutes without rebuilding and redeploying the whole site.

```txt
build once → serve static → after revalidate window → regenerate that page
```

Think of the revalidation interval as time-based [[caching|caching]] for rendered pages. ISR fits content that changes occasionally but doesn't need to be live on every request. When data must always be current per request, reach for [[ssr|server-side rendering]] instead.
