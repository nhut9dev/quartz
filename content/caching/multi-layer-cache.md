---
title: Multi-layer cache
description: Caching the same data at several stacked layers between the user and the database.
tags:
  - caching
---

A **multi-layer cache** stores copies of data at multiple points along the request path, so a read can be served from the nearest hit.

Layers typically stack as browser cache, [[../web/cdn|CDN]], application cache, and database cache. A request checks each layer in turn and stops at the first hit, falling through to the origin only on a full miss.

Each layer trades freshness for proximity. Outer layers are fastest but most likely to serve stale data; inner layers are closer to the source of truth.

The hard part is coordination: [[cache-invalidation|invalidating]] one layer leaves others stale. Aligning [[cache-ttl|TTLs]] and validators like [[etag|ETag]] across layers keeps them consistent.

See also [[../web/caching|web caching]].
