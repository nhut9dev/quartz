---
title: Cache TTL
description: The time a cached value can live before it expires.
tags:
  - caching
---

**Cache TTL** stands for time to live.

It defines how long a cached value can be reused before the cache treats it as expired.

Short TTLs reduce stale data but increase backend load. Long TTLs improve speed and cost but make freshness harder.

TTL works well with [[stale-while-revalidate|stale-while-revalidate]] when slightly stale data is acceptable.
