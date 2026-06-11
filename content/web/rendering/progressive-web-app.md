---
title: Progressive Web App
description: A web app installable to the home screen with offline support and an app-like experience.
tags:
  - web
  - offline
---

A **Progressive Web App** (PWA) is a regular web app enhanced so it can be installed to the home screen and behave like a native app. Two pieces make this work: a [[service-worker|service worker]] that caches assets and serves them offline, and a web app manifest, a JSON file that declares the app's name, icons, theme color, and display mode.

```json
{ "name": "My App", "start_url": "/", "display": "standalone" }
```

With a valid manifest and an active service worker over HTTPS, browsers offer an install prompt; once installed the app launches in its own window without browser chrome. PWAs degrade gracefully, working as an ordinary site where these features are unsupported. Choose a PWA when you want offline support and an installable, app-like experience without shipping to app stores.
