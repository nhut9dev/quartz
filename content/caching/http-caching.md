---
title: HTTP caching
description: Using HTTP headers so browsers and proxies can reuse responses instead of refetching.
tags:
  - caching
---

**HTTP caching** is the mechanism by which browsers, proxies, and [[cdn-cache|CDNs]] store responses and reuse them, governed entirely by response headers. It turns the network itself into a cache layer that costs nothing to maintain in application code.

## Freshness: serving without asking

While a response is *fresh*, a cache reuses it with no contact to the server at all. `Cache-Control` decides freshness: `max-age=N` marks a response fresh for N seconds; `no-store` forbids caching entirely; `private` restricts it to the browser (not shared proxies); `public` allows shared caching. This is the fast path — a fresh hit is a local read, zero network round-trips.

## Revalidation: cheap re-checking

Once a response goes *stale*, the cache doesn't discard it — it asks whether it's still valid. A **conditional request** carries a validator the server gave earlier: an [[etag|ETag]] (a content fingerprint) via `If-None-Match`, or `Last-Modified` via `If-Modified-Since`. If nothing changed, the server replies `304 Not Modified` with empty body, and the cache reuses its stored copy. So even a stale entry usually costs only a tiny round-trip, not a full re-download. [[stale-while-revalidate|stale-while-revalidate]] goes further, serving the stale copy instantly while revalidating in the background.

## Pitfalls

The two `Cache-Control` failure modes are opposite: too-long `max-age` on something that changes means users are stuck with stale content until expiry (no way to push an update short of changing the URL), while no caching headers at all wastes the whole layer. Caching a personalized response as `public` leaks it to other users through a shared cache — see [[cdn-cache|CDN]] pitfalls. And a missing or mis-set `Vary` header lets a cache serve one encoding or language variant to clients that needed another. See [[../web/backend/caching|web caching]] for the broader picture.
