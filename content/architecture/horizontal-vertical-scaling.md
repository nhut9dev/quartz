---
title: Horizontal and vertical scaling
description: Two ways to increase system capacity.
tags:
  - architecture
---

**Vertical scaling** (scaling up) gives one machine more CPU, memory, or disk. **Horizontal scaling** (scaling out) adds more machines or instances and spreads work across them. They're the two fundamental ways to add capacity, with very different cost and complexity curves.

## The trade-off

Vertical scaling is the simpler path: no code changes, no distribution — just a bigger box, and the application is none the wiser. But it has a hard ceiling (the largest machine you can buy or rent), costs rise non-linearly at the top end, and one box is still one [[load-balancing|single point of failure]].

Horizontal scaling has no such ceiling — you keep adding commodity instances — and it improves availability as a side effect, since losing one of many instances isn't fatal. The catch is that it only works if the application *can* be spread out: it demands stateless services (so any instance can handle any request), [[load-balancing|load balancing]] to distribute traffic, and a strategy for shared data, since the database is now contended by many instances.

## Choosing between them

Scale up first when you can — it's cheaper in engineering effort and buys time. Scale out when you hit the ceiling, need higher availability than one machine offers, or have bursty/elastic demand that suits adding and removing instances on the fly. In practice mature systems do both: scale stateless app servers out, scale the harder-to-distribute database up (until it too must be sharded or replicated).

## Pitfalls

The blocker for scaling out is **state in the instance** — in-memory sessions, local file uploads, sticky caches — because it assumes a request always returns to the same box; externalize it (shared session store, object storage) first. Vertical scaling lulls teams into ignoring this until they hit the ceiling and discover the app was never horizontally scalable. And scaling out the app tier just relocates the bottleneck to whatever is *still* shared — usually the database, which is why it's the hardest tier to scale and where most scaling effort eventually concentrates.
