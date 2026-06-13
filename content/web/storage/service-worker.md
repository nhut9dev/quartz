---
title: Service worker
description: A background script the browser runs separately from the page to intercept network requests.
tags:
  - web
  - offline
---

A **service worker** is a background script the browser runs separately from any page, on its own thread and even when no tab is open. It sits between the page and the network, so it can intercept outgoing requests through its `fetch` event and decide whether to answer from a cache or hit the server. This is what makes offline support and [[caching|caching]] strategies like cache-first or stale-while-revalidate possible.

Because it has no DOM access and a lifecycle of its own, a service worker is registered from the page and then runs independently.

```js
navigator.serviceWorker.register('/sw.js')
```

It must be served over HTTPS and is scoped to a path. Beyond offline, it underpins background sync and [[web-push|web push]] notifications. Reach for one when you need offline behavior or a [[../rendering/progressive-web-app|Progressive Web App]], not for simple request caching that HTTP headers already handle.

## How it works

A service worker has a lifecycle separate from any page: **install** fires once, when it's first registered or a new version is found, and is typically used to pre-cache assets; **activate** fires when this worker takes over from a previous version, used to clean up old caches; then **fetch** intercepts every network request from pages within its scope for as long as it's active. A new version installs alongside the running one but waits to activate until every tab using the old version has closed — unless the code explicitly calls `skipWaiting`.

## When to use

Cache-first suits static assets that rarely change — serve instantly from cache, fall back to network only on a miss. Network-first or stale-while-revalidate suits content that should stay fresh but can tolerate a cached fallback when offline or slow.

## Trade-offs

The service worker only provides the interception point — the caching policy is entirely up to your code. That flexibility means getting it wrong (caching too aggressively, or never invalidating) is easy, and unlike a server misconfiguration, the failure is invisible: it just looks like the site is "being weird" for some users.

## Pitfalls

The classic failure is a deploy that never reaches users: a new service worker installs but doesn't activate because an open tab from before the deploy keeps the old worker alive, so that tab — and any new tab, until all old ones close — keeps being served stale cached assets. A service worker that caches an API response or HTML shell too aggressively can make a site appear broken after a deploy, with no visible error, simply because old cached code is now running against a new backend — until the cache expires or is explicitly busted.
