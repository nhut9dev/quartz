---
title: Write-through
description: A caching pattern where writes go through the cache to the backing store.
tags:
  - caching
---

**Write-through** is a [[caching|caching]] pattern that writes data to the cache and backing store as part of the write path.

It can keep cached values fresher than [[cache-aside|cache-aside]], but adds latency and complexity to writes.

Use it when read consistency from the cache matters more than keeping write paths minimal.
