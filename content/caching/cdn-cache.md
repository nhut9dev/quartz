---
title: CDN cache
description: Caching responses at edge locations close to users.
tags:
  - caching
  - web
---

A **CDN cache** stores static assets or HTTP responses at edge locations geographically close to users, so requests are served from the nearest edge instead of traveling to the origin.

It reduces latency, origin load, and bandwidth cost in one move.

## How it works

The CDN is a network of edge servers (points of presence) in front of your origin. A user's request is routed to the nearest edge; on a hit, the edge serves its cached copy directly. On a miss, the edge fetches from the origin, stores the response according to its [[http-caching|HTTP caching]] headers, and serves it — so subsequent nearby users hit the warm edge. The [[cache-key|cache key]] is typically the URL plus whatever the `Vary` header names, and freshness is governed by `Cache-Control`. Updates happen by waiting out the TTL or by an explicit **purge** that evicts a URL across edges.

## When to use

CDN caching fits anything shareable across users: static assets (JS, CSS, images, downloads), public pages, and API responses that aren't user-specific. The key requirement is that one cached copy is correct for many users — the more personalized a response, the less a shared edge cache can help.

## Pitfalls

The dangerous mistake is caching **private data** at a shared edge — a response with a user's data and a cacheable `Cache-Control` gets served to the next user of that URL. Mark per-user responses `private`/`no-store` and key carefully on auth. Forgetting `Vary` (on `Accept-Encoding`, `Accept-Language`) makes the edge serve one variant to everyone. And because purge propagation across edges isn't instant, content-hashed filenames (`app.3f9a.js`) are more reliable than purging for assets that change — you change the URL instead of invalidating the old one.
