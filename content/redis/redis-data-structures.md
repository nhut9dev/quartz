---
title: Redis data structures
description: Redis values such as strings, hashes, lists, sets, sorted sets, streams, and bitmaps.
tags:
  - redis
  - data-structures
---

**Redis data structures** are built-in value types such as strings, hashes, lists, sets, sorted sets, streams, and bitmaps.

Choosing the right type matters more than treating Redis as a generic key-value store. Strings fit counters and blobs, hashes fit small objects, sets fit membership, sorted sets fit leaderboards or time-ranked items, and streams fit append-only event-like workflows.

The data structure shapes command complexity, memory use, and cleanup strategy. A [[redis-cache|cache]] entry and a rate limiter counter should not be modeled the same way.

Use simple types first, but learn the specialized commands before building awkward structures in application code.
