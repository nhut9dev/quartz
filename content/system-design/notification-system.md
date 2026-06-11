---
title: Notification system
description: A system that delivers user-facing messages across channels such as email, push, SMS, and in-app.
tags:
  - system-design
  - messaging
---

A **notification system** delivers user-facing messages across channels such as email, push, SMS, and in-app notifications.

Core parts include event ingestion, user preferences, templates, channel routing, delivery providers, retry handling, deduplication, and delivery status tracking.

Notification systems need strong controls for frequency, user consent, quiet hours, and idempotency so retries do not spam users.

They usually combine [[../messaging/message-queue|queues]], [[../messaging/dead-letter-queue|dead-letter queues]], [[../api-design/idempotency-key|idempotency keys]], and observability.
