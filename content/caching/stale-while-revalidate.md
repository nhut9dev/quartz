---
title: Stale-while-revalidate
description: A caching strategy that serves stale data while refreshing it in the background.
tags:
  - caching
  - web
---

**Stale-while-revalidate** serves cached data immediately, then refreshes it in the background.

It improves perceived speed when slightly stale data is acceptable.

This strategy appears in [[caching|HTTP caching]], service workers, [[cdn|CDN]] behavior, and frontend data-fetching libraries like [[swr|SWR]].
