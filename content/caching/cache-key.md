---
title: Cache key
description: The identifier used to store and retrieve a cached value.
tags:
  - caching
---

A **cache key** identifies one cached value.

Good cache keys include the inputs that change the output, such as user id, locale, query filters, feature flags, and version.

Bad cache keys are too broad and return the wrong data, or too specific and prevent useful reuse.

Cache key design is tightly connected to [[cache-invalidation|cache invalidation]] because the system must know which keys become stale after a change.
