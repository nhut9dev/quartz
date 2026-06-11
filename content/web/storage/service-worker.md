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

It must be served over HTTPS and is scoped to a path. Beyond offline, it underpins background sync and [[web-push|web push]] notifications. Reach for one when you need offline behavior or a [[progressive-web-app|Progressive Web App]], not for simple request caching that HTTP headers already handle.
