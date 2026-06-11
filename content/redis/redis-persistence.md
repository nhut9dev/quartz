---
title: Redis persistence
description: Redis options for writing in-memory data to disk for restart recovery.
tags:
  - redis
  - durability
---

**Redis persistence** is Redis writing in-memory data to disk for restart recovery.

Redis commonly uses RDB snapshots, AOF append-only logs, or both. RDB is compact and good for point-in-time snapshots; AOF can reduce data loss by logging writes more frequently.

Use persistence when Redis holds data that should survive restarts, such as queues, coordination state, or expensive precomputed data. Pure [[redis-cache|cache]] workloads may not need durable persistence.

Persistence is not the same as strong durability. Crashes, replication lag, disk issues, and configuration choices still define how much data can be lost.
