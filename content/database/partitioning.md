---
title: Partitioning
description: Splitting one logical database table into smaller physical parts.
tags:
  - database
  - scalability
---

**Partitioning** splits one logical table into smaller physical parts.

Common partition keys include time, tenant, region, or id ranges. Partitioning can improve maintenance, retention, and query performance when queries target specific partitions.

Partitioning is not the same as [[sharding|sharding]]. A partitioned table may still live inside one database system, while sharding distributes data across multiple database nodes.

Bad partition keys can make queries more complex without improving performance.
