---
title: Cache warming
description: Pre-populating a cache before real traffic arrives to avoid a cold-start miss storm.
tags:
  - caching
---

**Cache warming** is loading expected data into a cache ahead of time, so the first real requests hit a warm cache instead of an empty one.

## How it works

A freshly started or freshly cleared cache is *cold*: every read misses and falls through to the origin. Under load, that burst of simultaneous misses can overwhelm the database — the same dynamic as a [[cache-stampede|cache stampede]], but triggered by a cold cache rather than an expiry. Warming front-loads the work before traffic arrives by pre-fetching known-hot keys, replaying recent access logs to reconstruct the likely working set, or running a background job to populate entries before the service is opened to traffic.

## When to use

Warm the cache around events that empty it or spike demand: a deploy that flushes the cache, a cache-server restart, a scheduled sale or launch with a predictable traffic surge, or bringing a new replica into rotation. It's most valuable when the origin can't survive a full cold-miss storm.

## Trade-offs

Warming trades effort and freshness for a smooth start. You have to *predict* which keys matter — imperfect, so you warm some keys that go unused and miss some that mattered — and warmed data can already be stale by the time real requests arrive. It pairs naturally with [[cache-aside|cache-aside]] and with deploy processes that clear the cache; if your cache survives deploys, you may not need it at all.
