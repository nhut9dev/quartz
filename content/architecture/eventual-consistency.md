---
title: Eventual consistency
description: A consistency model where replicas converge after some delay.
tags:
  - architecture
  - database
---

**Eventual consistency** means data may be temporarily different across parts of a system, but should converge if no new updates occur.

It often appears in [[replication|replicated]] databases, [[caching|caches]], search indexes, and [[event-driven|event-driven]] systems.

It can improve availability and scalability, but product flows must tolerate stale reads, retries, and reconciliation.
