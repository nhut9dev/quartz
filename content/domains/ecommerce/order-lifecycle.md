---
title: Order lifecycle
description: The states an ecommerce order moves through from creation to completion, cancellation, or return.
tags:
  - domains
  - ecommerce
---

An **order lifecycle** describes the states an order moves through: created, pending payment, paid, packed, shipped, delivered, cancelled, refunded, or returned.

The lifecycle should be modeled explicitly because fulfillment, customer support, finance, notifications, and analytics all depend on the same state transitions.

Avoid treating order status as a loose string. The allowed transitions, actor permissions, timestamps, and side effects should be clear.

Related notes: [[../../design-patterns/state-pattern|State pattern]], [[../../messaging/outbox-pattern|Outbox pattern]], and [[../../observability/structured-logging|Structured logging]].
