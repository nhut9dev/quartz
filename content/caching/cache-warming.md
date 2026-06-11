---
title: Cache warming
description: Pre-populating a cache before real traffic arrives to avoid a cold-start miss storm.
tags:
  - caching
---

**Cache warming** is loading expected data into a cache ahead of time, so the first real requests hit a warm cache instead of an empty one.

A freshly started or freshly cleared cache is cold: every read misses and falls through to the origin. Under load, that burst of misses can overwhelm the database, a problem related to [[cache-stampede|cache stampede]].

Warming pre-fetches known-hot keys, replays recent access logs, or runs a background job to populate the cache before opening it to traffic.

The tradeoff is effort and freshness: warmed data can already be stale by the time real requests arrive, and predicting which keys matter is imperfect.

It pairs naturally with [[cache-aside|cache-aside]] and deploys that clear the cache.
