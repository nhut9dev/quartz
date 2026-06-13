---
title: Stale-while-revalidate
description: A caching strategy that serves stale data while refreshing it in the background.
tags:
  - caching
  - web
---

**Stale-while-revalidate** (SWR) serves a cached value immediately even after it expires, then refreshes it in the background so the *next* request gets fresh data — trading a bounded amount of staleness for never blocking a read on a recompute.

## How it works

An entry has two windows: a fresh window, and a stale-but-servable window after it. While fresh, it's served normally. Once it expires into the stale window, the cache does two things at once: it returns the stale value to the current request *right away*, and it kicks off an asynchronous revalidation to fetch a fresh copy. That fresh copy replaces the entry for subsequent requests. No request waits on the origin — the latency of the refetch is hidden behind the stale response.

In HTTP this is the `stale-while-revalidate` directive in `Cache-Control`; the same idea drives the [[swr|SWR]] data-fetching library, [[cdn-cache|CDN]] behavior, and service workers.

## When to use

Use it when slightly stale data is acceptable and read latency matters more than perfect freshness — dashboards, listings, profile data, most read-heavy UI. It's especially effective against [[cache-stampede|cache stampede]]: because the stale value is served during revalidation, an expiring hot key never produces a wall of blocked, recomputing requests.

## Pitfalls

It's the wrong tool when staleness is unacceptable (prices, balances, permissions) — there's no version of SWR that returns *only* fresh data. The staleness window is unbounded if the origin is failing: a value can be served stale indefinitely while every background revalidation errors, which is sometimes desirable (graceful degradation) and sometimes hides a broken backend. And naive implementations fire one revalidation *per* stale request instead of coalescing them, reintroducing the stampede SWR was meant to prevent.
