---
title: CDN
description: Distributed servers that cache content close to users for lower latency.
tags:
  - web
  - infrastructure
---

**CDN** (content delivery network) is a set of geographically distributed servers that cache static assets and pages close to users. Instead of every request traveling to one origin server, users are served from a nearby edge location, which lowers latency and offloads traffic from the origin.

CDNs are a natural home for content that does not change per request: [[ssg|statically generated]] HTML, images, fonts, and JavaScript bundles. Because these files are identical for everyone, the edge can [[caching|cache]] them aggressively and serve them in milliseconds.

They also pair well with [[code-splitting|code splitting]]: smaller bundle chunks cache and download independently, so a user only fetches the pieces a page needs, each from the nearest edge. The result is faster loads worldwide without scaling up the origin.

The usual request path is:

```txt
browser -> nearest CDN edge -> origin server
```

If the edge has a fresh copy, it responds directly. If not, it fetches from the origin, stores the response according to cache rules, and then serves the user.

CDNs can also terminate TLS, compress assets, resize images, and apply simple edge rules, but their biggest win is still moving cacheable work closer to users.

## How it works

Each edge node keys its cache the same way an origin cache would — by URL plus the headers the response varies on. A request that misses at the edge ("cache fill") is forwarded to the origin, the response is stored at that edge node according to its cache rules, and then served. Other edge nodes don't automatically share this entry — a user hitting a different edge location may still cause its own cache fill.

## When to use

CDNs are the natural home for [[../rendering/ssg|statically generated]] pages, images, fonts, and JS bundles — anything identical for everyone. Pairing with stale-while-revalidate extends this to content that changes occasionally but can tolerate a brief window of staleness while the edge refreshes in the background.

## Trade-offs

Invalidating a CDN cache is slower and more limited than invalidating an in-process cache: a global purge can take seconds to propagate across every edge location, and selective purging by path or tag depends on what the provider supports. This makes CDNs a poor fit for content that needs to change instantly everywhere, even if they're ideal for content that's mostly stable.

## Pitfalls

Caching a response that varies per user — by cookie, auth header, or session — without declaring `Vary` correctly means the edge can serve one user's personalized response to another, a serious privacy bug that's easy to miss in testing since the first request "looks right." Similarly, an origin error response cached with a long TTL — a `500` returned during a brief outage — can get served to every user from the edge until it's purged, long after the origin recovers.
