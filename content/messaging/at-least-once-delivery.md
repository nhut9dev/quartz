---
title: At-least-once delivery
description: A messaging guarantee where each message should be delivered one or more times.
tags:
  - messaging
---

**At-least-once delivery** means a message should not be lost, but it may be delivered more than once.

This is common in reliable [[message-queue|message queues]] because retrying after uncertain failures can produce duplicates.

Consumers must be designed for repeat delivery with [[message-deduplication|deduplication]] and idempotent side effects.

The tradeoff is practical reliability with extra responsibility at the consumer boundary.
