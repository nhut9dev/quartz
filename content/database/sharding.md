---
title: Sharding
description: Splitting one logical dataset across multiple database nodes.
tags:
  - database
---

**Sharding** partitions data across multiple database nodes.

For example, users may be split by user ID range, hash, region, or tenant.

Sharding can increase capacity, but it adds operational and query complexity.

Use it when a single database cannot reasonably handle the workload. It is not a first step for ordinary applications.
