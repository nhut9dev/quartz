---
title: Browser cache
description: The client-side HTTP cache that stores reusable responses in the browser.
tags:
  - browser
  - caching
  - web
---

The **browser cache** stores reusable HTTP responses on the client so later requests can avoid downloading the same bytes again.

It is controlled by headers such as `Cache-Control`, `ETag`, and `Last-Modified`. Fresh cached responses can be reused immediately, while stale responses may be revalidated with the server.

Browser cache is separate from application storage such as IndexedDB and from [[../caching/cdn-cache|CDN cache]], but they often work together in a full caching strategy.

Good browser caching uses long-lived immutable asset URLs and short or revalidated caching for HTML and user-specific data.
