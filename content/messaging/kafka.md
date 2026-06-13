---
title: Kafka
description: A distributed event streaming platform for high-throughput logs and streams.
tags:
  - messaging
---

**Kafka** is a distributed event streaming platform that stores events in ordered, append-only topic partitions and keeps them for a configurable retention period.

It is commonly used for [[event-driven|event streaming]], analytics pipelines, service integration, and high-throughput messaging.

## How it works

A topic is split into **partitions**, and each partition is an ordered, immutable log. A producer appends to the tail; each message gets a monotonically increasing **offset**. Ordering is guaranteed *within* a partition but not across partitions, so the partition key (e.g. `userId`) decides which events stay ordered relative to each other.

The crucial difference from a traditional queue: consuming does not delete the message. Kafka retains events by time or size, and each consumer tracks its own **committed offset** — its position in the log. That's what makes replay possible: reset the offset backwards and reprocess history. A [[consumer-group|consumer group]] divides partitions among its members so that each partition is read by exactly one consumer in the group, which is how Kafka scales reads horizontally while preserving per-partition order.

## When to use

Use Kafka when you need retention and replay (reprocess a week of events into a new system), high sustained throughput, multiple independent consumers of the same stream, or an event log that is itself the source of truth (it pairs naturally with [[event-sourcing|event sourcing]]). It shines as a durable backbone many services read from.

## Trade-offs

Kafka buys throughput, retention, and replay at the cost of operational weight — partitions, replication, consumer-group rebalancing, and offset management are real complexity a simple [[message-queue|queue]] or [[rabbitmq|RabbitMQ]] doesn't impose. It is also not built for per-message routing or selective acknowledgement; its model is "read the log in order," not "hand me whichever message is ready."

## Pitfalls

Partition count caps consumer parallelism: a group can't have more active consumers than partitions, and repartitioning later reshuffles key-to-partition mapping. A single slow consumer in a group stalls its assigned partitions while others race ahead, skewing lag. And because ordering is only per-partition, choosing a key with poor distribution (or none) either destroys ordering guarantees you assumed or funnels traffic onto one hot partition.
