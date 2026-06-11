---
title: Service worker lifecycle
description: How a service worker installs, activates, controls pages, and updates.
tags:
  - browser
  - web
  - pwa
---

The **service worker lifecycle** governs when a [[../web/service-worker|service worker]] can cache assets, intercept requests, and serve offline behavior — and it's deliberately cautious so an update never swaps code under a running page.

## The phases

A worker is **registered**, then **installs** (the moment to pre-cache assets), then **activates** (the moment to clean up old caches), and finally **controls** matching pages, intercepting their `fetch` events. A freshly installed worker doesn't take over immediately: it sits in a **waiting** state until every tab controlled by the old worker has closed.

## Updates

On navigation the browser re-fetches the worker script and byte-compares it; any difference installs a new worker, which then waits. Calling `skipWaiting()` (usually with `clients.claim()`) lets the new worker activate and take control right away instead of waiting for tabs to close.

## Pitfalls

The waiting behavior is why users get *stale* code — they keep seeing the old worker until they fully close the app. `skipWaiting()` fixes that but can break an open page if its already-loaded HTML now points at assets the new worker has purged, so version your caches and delete old ones in `activate`. A worker's scope is limited to its path and below, and the whole API requires HTTPS. These workers underpin [[../web/progressive-web-app|progressive web apps]].
