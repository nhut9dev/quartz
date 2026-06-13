---
title: Consumer group
description: A set of consumers that share work from a queue or stream.
tags:
  - messaging
---

A **consumer group** lets multiple consumer instances process messages from the same stream or queue as one logical worker, dividing the work among themselves.

Consumer groups are central to [[kafka|Kafka]], where partitions are distributed across the members of a group.

## How it works

The broker assigns each partition (Kafka) or shard to exactly one consumer in the group, so no two members process the same message — that's what turns N instances into N× throughput without double-processing. Each group tracks its own committed offset per partition, so different groups reading the same topic advance independently: an analytics group and a billing group both see every event, each at its own pace.

When a member joins, leaves, or dies, the group **rebalances** — partitions are reassigned among the surviving members. During a rebalance, processing briefly pauses while assignments are recomputed, and a partition may move to a consumer that then reprocesses from the last committed offset.

## When to use

Use a group whenever one logical consumer needs to scale horizontally: a single instance can't keep up with the topic's throughput, or you want redundancy so processing continues if an instance crashes. Use *separate* groups when multiple independent systems each need the full stream.

## Trade-offs

Parallelism is capped by partition count — adding consumers beyond the number of partitions leaves the extras idle. You gain throughput and failover, but only within per-partition ordering: messages stay ordered inside a partition, never across the group as a whole.

## Pitfalls

Frequent rebalances (from flapping instances, long pauses, or slow processing that trips a session timeout) cause "rebalance storms" where the group spends more time reassigning than working. A single slow consumer becomes the lag for its whole partition while peers race ahead. And because a rebalance can hand a partition to a new consumer that reprocesses from the last commit, handlers must be idempotent through [[message-deduplication|deduplication]] — committing offsets *before* the work is done turns a rebalance into silent message loss.
