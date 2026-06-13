---
title: Partitioning
description: Splitting one logical database table into smaller physical parts.
tags:
  - database
  - scalability
---

**Partitioning** splits one logical table into smaller physical pieces (partitions) by a partition key, while it still behaves as a single table to queries — usually within one database instance.

## How it works

You declare a partition key and a scheme — **range** (by date: one partition per month), **list** (by region or category), or **hash** (even spread by id). The database stores each partition as a separate physical structure but presents one logical table; inserts route to the right partition automatically, and queries that filter on the partition key benefit from **partition pruning** — the planner skips partitions that can't match, scanning far less data. The big operational win is that you can drop or archive a whole partition (last year's data) instantly, instead of a slow, lock-heavy `DELETE` over millions of rows.

## Partitioning vs sharding

They're often confused. **Partitioning** divides a table *within one database node* — it helps maintenance, retention, and pruning, but the data still lives on one machine, so it doesn't add total capacity. **[[sharding|Sharding]]** distributes data *across multiple nodes* — it adds write and storage capacity, at the cost of cross-node complexity. Partitioning is a much lighter step; you reach for it for manageability and query pruning, and for sharding only when one node truly isn't enough.

## Pitfalls

A partition key that doesn't match query patterns gives no pruning — queries that don't filter on it must scan *every* partition, which can be slower than an unpartitioned table plus a good index. Time-range partitioning needs ongoing partition management (creating next month's partition ahead of time; a missing one breaks inserts), usually automated. And partitioning is not a substitute for [[database-index|indexes]] — within each partition you still need appropriate indexes; partitioning prunes which partitions to look at, indexes find rows within them.
