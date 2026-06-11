---
title: Hot key
description: A single cache key receiving disproportionate traffic that overloads one node or shard.
tags:
  - caching
  - performance
---

A **hot key** is a single cache entry that draws so much traffic it saturates the one node responsible for it.

## How it works

Cache clusters spread keys across nodes by hashing the key name, so each key lives on exactly one shard. When one item is wildly more popular than the rest, a celebrity user's profile, a viral product, all that load lands on a single node while the others sit idle. This is consistent-hashing skew taken to an extreme: balancing assumes roughly uniform demand, and a hot key breaks that assumption.

## Pitfalls

Detect hot keys before they cause an outage by sampling per-key request counts or watching for one node running far hotter than its peers. A hot key amplifies a [[cache-stampede|cache stampede]]: when that one popular value expires, every request for it stampedes the same node at once.

## Tradeoffs

Mitigations trade consistency or memory for spread. A small in-process cache in front of the shared cache absorbs most reads locally but can serve briefly stale data, see [[multi-layer-cache|multi-layer cache]]. Replicating or splitting the key across several nodes spreads load at the cost of harder invalidation. Request coalescing collapses concurrent misses into one backend call. The underlying placement is governed by [[../system-design/consistent-hashing|consistent hashing]].
