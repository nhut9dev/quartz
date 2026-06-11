---
title: Consumer group
description: A set of consumers that share work from a queue or stream.
tags:
  - messaging
---

A **consumer group** lets multiple consumers process messages from the same stream or queue as one logical worker.

Each message or partition is assigned to one consumer in the group, which allows horizontal scaling.

Consumer groups are central to [[kafka|Kafka]] because partitions are distributed across consumers.

They improve throughput but require careful handling of rebalancing, retries, ordering, and slow consumers.
