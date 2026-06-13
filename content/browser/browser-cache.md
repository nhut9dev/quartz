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

## How it works

`Cache-Control: max-age=N` marks a response **fresh** for `N` seconds — during that window the browser reuses it with no network request at all. Once stale, the browser doesn't necessarily refetch the whole thing: if the original response had an `ETag` or `Last-Modified`, the browser sends a conditional request (`If-None-Match` / `If-Modified-Since`). If the resource hasn't changed, the server replies `304 Not Modified` with no body, and the browser reuses its cached copy — cheap, but still a round trip. `Cache-Control: no-store` skips the cache entirely; `no-cache` (despite the name) stores the response but always revalidates before reuse.

## When to use

The standard pattern splits assets into two groups. **Fingerprinted static assets** (JS/CSS bundles with a content hash in the filename, e.g. `app.3f2a1c.js`) get `Cache-Control: max-age=31536000, immutable` — a year-long cache is safe because any content change produces a *new* URL. **HTML and API responses** that change get a short `max-age` or `no-cache` plus an `ETag`, so the browser revalidates cheaply instead of either re-downloading everything or serving stale data for a long window.

## Trade-offs

Long `max-age` on fingerprinted assets means repeat visits load instantly with zero requests — but only works if your build actually changes the filename on every content change; if it doesn't, users can be stuck on old code for up to a year. Revalidation via `ETag` guarantees correctness (you always get the latest version, eventually) at the cost of a round trip on every load past the freshness window, even when nothing changed — a `304` is cheap, but it's not free, and on a slow connection it still adds latency.

## Pitfalls

Caching HTML aggressively is the classic mistake: if `index.html` is cached for a day, users can keep loading an old page that references asset hashes which no longer exist (because the new build deleted them), breaking the app until the HTML cache expires. Browser cache headers are also often conflated with [[../caching/cdn-cache|CDN cache]] — a CDN respects `Cache-Control` by default but can be tuned separately with `s-maxage`, so "the browser cache" and "the CDN cache" can hold different content for different durations from the same header. Finally, "why isn't my change showing" debugging is often just a stale cached response — hard refresh, incognito, or DevTools' "disable cache" rule that out before assuming the deploy failed.
