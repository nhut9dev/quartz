---
title: Consistency model
description: The rules that describe what reads can observe after writes in a distributed system.
tags:
  - system-design
  - distributed-systems
---

A **consistency model** describes what a reader is allowed to see after data changes.

Strong consistency favors correctness and simple mental models. Eventual consistency favors availability, lower latency, and easier replication, but users may see stale data for a short time.

Choose the model per workflow, not per system. User profiles, search indexes, counters, payments, and permissions often have different freshness requirements. This connects directly to [[../architecture/eventual-consistency|eventual consistency]] and [[cache-consistency|cache consistency]].
