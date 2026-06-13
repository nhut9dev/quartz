---
title: RabbitMQ
description: A message broker commonly used for queues and routing patterns.
tags:
  - messaging
---

**RabbitMQ** is a message broker often used as a [[message-queue|message queue]] for task queues and service communication, with rich broker-side routing.

## How it works

RabbitMQ separates publishing from queuing through **exchanges**. A producer publishes to an exchange, never directly to a queue. The exchange's type and the message's **routing key** decide which bound queues receive a copy: a *direct* exchange matches the key exactly, a *topic* exchange matches wildcard patterns, and a *fanout* exchange ignores the key and broadcasts to all bound queues. This routing logic lives in the broker, so producers stay ignorant of who consumes.

Delivery is driven by **acknowledgements**. The broker pushes a message to a consumer and holds it as unacked; the consumer acks on success (broker deletes it) or nacks/rejects on failure (broker requeues or dead-letters it). Unlike [[kafka|Kafka]], a consumed-and-acked message is gone — there is no retained log to replay.

## When to use

Reach for RabbitMQ when you want broker-managed work distribution and flexible routing: competing consumers draining a task queue, topic-based fan-out to several services, or per-message priority and TTL. It fits "do this work once, by someone" far more naturally than Kafka's "everyone reads the log."

## Trade-offs

You get fine-grained routing, per-message acks, and built-in [[dead-letter-queue|dead-letter]] handling — but no long retention or replay, and lower raw throughput than a partitioned log. Deep queues also strain memory, since RabbitMQ is happiest when queues stay short and messages flow through quickly.

## Pitfalls

If consumers can't keep up, queues back up in memory and the broker can hit flow-control or crash — RabbitMQ punishes large backlogs in a way Kafka's disk-based log does not. Prefetch (how many unacked messages a consumer holds) is a common footgun: too high and one greedy consumer hoards messages while others idle; too low and throughput stalls on round-trips. And because acked messages are deleted, a bug that acks before the work commits loses data with no log to recover from.
