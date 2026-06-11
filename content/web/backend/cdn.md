---
title: CDN
description: Distributed servers that cache content close to users for lower latency.
tags:
  - web
  - infrastructure
---

**CDN** (content delivery network) is a set of geographically distributed servers that cache static assets and pages close to users. Instead of every request traveling to one origin server, users are served from a nearby edge location, which lowers latency and offloads traffic from the origin.

CDNs are a natural home for content that does not change per request: [[ssg|statically generated]] HTML, images, fonts, and JavaScript bundles. Because these files are identical for everyone, the edge can [[caching|cache]] them aggressively and serve them in milliseconds.

They also pair well with [[code-splitting|code splitting]]: smaller bundle chunks cache and download independently, so a user only fetches the pieces a page needs, each from the nearest edge. The result is faster loads worldwide without scaling up the origin.

The usual request path is:

```txt
browser -> nearest CDN edge -> origin server
```

If the edge has a fresh copy, it responds directly. If not, it fetches from the origin, stores the response according to cache rules, and then serves the user.

CDNs can also terminate TLS, compress assets, resize images, and apply simple edge rules, but their biggest win is still moving cacheable work closer to users.
