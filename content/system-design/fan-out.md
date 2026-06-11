---
title: Fan-out
description: Sending one event or request to many downstream recipients.
tags:
  - system-design
  - messaging
---

**Fan-out** sends one event, message, or write to many downstream recipients.

It appears in feeds, notifications, chat, pub/sub systems, cache invalidation, and event-driven workflows.

Fan-out on write precomputes per-recipient data early. Fan-out on read computes results when a user requests them. The right choice depends on read frequency, write frequency, latency, and storage cost.

Fan-out is often implemented with [[../messaging/message-queue|message queues]], [[../design-patterns/pub-sub|pub/sub]] style delivery, or stream processing.
