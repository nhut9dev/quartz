---
title: Multi-layer cache
description: Caching the same data at several stacked layers between the user and the database.
tags:
  - caching
---

A **multi-layer cache** stores copies of data at multiple points along the request path, so a read can be served from the nearest hit and only a full miss reaches the origin.

## How it works

Layers stack from the user inward: browser cache → [[cdn-cache|CDN]] → application/in-memory cache → [[redis|Redis]] or other shared cache → database. A request checks each layer in turn and stops at the first hit, falling through to the next only on a miss. Each layer absorbs a fraction of the traffic the layer behind it would otherwise see, so the origin handles only the requests that miss *everywhere*.

Each layer trades freshness for proximity. Outer layers (browser, CDN) are fastest and cheapest but most likely to serve stale data and hardest to update on demand; inner layers are closer to the source of truth but slower and more loaded.

## When to use

Add layers when a single cache can't meet the latency or load target — a CDN cuts geographic latency a Redis layer can't, while Redis cuts database load a CDN can't reach because its data is private or dynamic. Each layer should earn its place by absorbing traffic the others can't; stacking caches "just in case" multiplies the invalidation problem below for no benefit.

## Pitfalls

Coordination is the hard part: [[cache-invalidation|invalidating]] one layer leaves the others stale, and you usually can't purge a user's browser cache at all. A change at the database can be masked by a stale CDN entry for the full CDN TTL, no matter how fast you invalidate Redis. Aligning [[cache-ttl|TTLs]] and sharing validators like [[etag|ETag]] across layers limits the divergence, but the only fully reliable update for outer layers is changing the URL (content-hashed asset names) so the old entry is simply never requested again.
