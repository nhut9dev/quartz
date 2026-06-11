---
title: Preload, prefetch, and preconnect
description: Browser resource hints for loading important resources sooner.
tags:
  - browser
  - performance
  - web
---

**Preload**, **prefetch**, and **preconnect** are resource hints that influence how the browser prepares network work.

`preload` tells the browser a resource is needed for the current page soon. `prefetch` prepares a likely future navigation or resource. `preconnect` starts DNS, TCP, and TLS setup early for an origin.

These hints can improve perceived speed when used sparingly, especially for fonts, critical images, route chunks, and important third-party origins.

Overusing them competes with truly critical requests and can make loading worse. They should be guided by [[../frontend-performance/profiling|profiling]] and [[../frontend-performance/lighthouse|Lighthouse]].
