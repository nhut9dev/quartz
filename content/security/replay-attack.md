---
title: Replay attack
description: Reusing a valid request, token, or message to trigger an action again.
tags:
  - security
  - web
---

A **replay attack** reuses a valid request, token, or message to trigger an action again.

It matters for payments, password resets, signed URLs, webhooks, login flows, and API calls with side effects.

Defenses include short expirations, nonces, timestamps, one-time tokens, request signatures, and [[../api-design/idempotency-key|idempotency keys]].

TLS protects traffic in transit, but replay defenses are still needed when a valid message can be captured from logs, clients, queues, or integrations.
