---
title: Webhook design
description: Designing outbound HTTP notifications that tell another system about an event.
tags:
  - api
  - integration
  - webhook
---

**Webhook design** covers how a system delivers event notifications to external HTTP endpoints.

Good webhooks include stable event types, signed payloads, retry policy, idempotency keys, delivery logs, and a way to replay missed events.

The receiving side will fail sometimes. Treat delivery as at-least-once and require consumers to handle duplicates. See [[../web/webhook|Webhook]] and [[../messaging/idempotent-consumer|Idempotent consumer]].
