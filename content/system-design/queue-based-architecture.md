---
title: Queue-based architecture
description: Using queues to decouple producers and consumers so work can be processed asynchronously.
tags:
  - system-design
  - messaging
---

A **queue-based architecture** places a message queue between the system that accepts work and the system that performs it.

This helps smooth traffic spikes, isolate slow consumers, and retry failed work. It is a common fit for email delivery, image processing, billing jobs, imports, and integrations.

The trade-off is operational complexity: messages need idempotent handling, dead-letter behavior, ordering decisions, and visibility into backlog growth. Related notes: [[../messaging/message-queue|Message queue]], [[../messaging/dead-letter-queue|Dead-letter queue]], and [[../messaging/idempotent-consumer|Idempotent consumer]].
