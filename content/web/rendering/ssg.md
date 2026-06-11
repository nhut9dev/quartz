---
title: Static site generation
description: HTML is rendered once at build time into static files served fast and cheap.
tags:
  - web
  - rendering
---

**Static site generation (SSG)** renders pages to HTML once, at build time, producing plain static files. There is no per-request work: a request just returns a pre-built file, often straight from a [[cdn|CDN]] edge near the user, which makes it fast and cheap to serve.

Because each page is real HTML available immediately, [[seo|SEO]] is excellent and first paint is quick. The tradeoff is freshness: the content is frozen at the moment of the build, so updating it means rebuilding and redeploying.

SSG suits content that doesn't change per request, such as blogs, docs, and marketing pages.

Contrast it with [[ssr|server-side rendering]], which re-renders on every request to reflect live, request-specific data. When you want most of SSG's speed but need a few pages to refresh without a full rebuild, [[isr|incremental static regeneration]] sits in between.
