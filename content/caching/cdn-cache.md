---
title: CDN cache
description: Caching responses at edge locations close to users.
tags:
  - caching
  - web
---

A **CDN cache** stores static assets or HTTP responses at edge locations closer to users.

It reduces latency, origin traffic, and bandwidth cost.

CDN caching depends on URL design, response headers, [[cache-key|cache keys]], and explicit purge or revalidation behavior.

It is most useful for static assets, public pages, images, downloads, and API responses that can be shared safely across users.
