---
title: Event-driven architecture
description: An architecture style where systems react to events that describe something that happened.
tags:
  - messaging
  - architecture
---

**Event-driven architecture** connects systems through events, often delivered over a [[message-queue|message queue]] or [[pub-sub|pub/sub]] channel.

An event describes something that happened, such as `OrderCreated` or `PaymentFailed`.

This can reduce direct coupling, but it requires strong observability, [[idempotency|idempotent]] handlers, and clear event contracts.
