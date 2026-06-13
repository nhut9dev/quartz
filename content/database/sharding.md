---
title: Sharding
description: Splitting one logical dataset across multiple database nodes.
tags:
  - database
---

**Sharding** splits one logical dataset across multiple independent database nodes (shards), each holding a subset of the data — the main way to scale *writes* and total data size beyond a single machine.

## How it works

A **shard key** decides which node owns a given row. Common strategies: **hash** the key (e.g. `hash(user_id) % N`, or better, [[../system-design/consistent-hashing|consistent hashing]]) for even distribution; **range** partitioning (users A–M here, N–Z there) for locality; or by **tenant/region** for isolation and compliance. A query for a specific key routes to the one shard that owns it; a query without the shard key must **scatter-gather** across all shards and merge results.

Unlike [[../system-design/read-replica|read replicas]] (which copy the *whole* dataset to scale reads), sharding *divides* the dataset, so each shard takes a fraction of the writes and storage — which is why it's the answer when the write volume or data size exceeds one node.

## When to use

Shard only when a single node genuinely can't cope — write throughput, data volume, or memory exceeds what the biggest practical machine plus replicas can handle. It is **not** a first step: the operational and query complexity is large, and most applications should exhaust vertical scaling, indexing, caching, and read replicas first.

## Pitfalls

The **shard key choice is the whole game and is painful to change** later. A poor key creates hot shards (one shard gets most traffic, defeating the point) or forces cross-shard scatter-gather on common queries. **Cross-shard operations** lose what a single database gave for free: joins across shards are hard, and a [[transaction|transaction]] can't span shards without distributed-transaction machinery, pushing you toward [[../messaging/saga|sagas]] and [[../architecture/eventual-consistency|eventual consistency]]. **Rebalancing** when adding shards moves data and is disruptive unless the scheme (consistent hashing) was designed for it. Sharding trades a scaling ceiling for permanent complexity in every query and transaction.
