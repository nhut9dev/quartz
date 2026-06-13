---
title: Notification system
description: A system that delivers user-facing messages across channels such as email, push, SMS, and in-app.
tags:
  - system-design
  - messaging
---

A **notification system** delivers user-facing messages across channels — email, push, SMS, in-app — turning an internal event ("order shipped") into the right message, on the right channel, for the right user.

## Core components

A request flows through a pipeline: **event ingestion** (something happened worth notifying about) → **preference and consent check** (does this user want this, on which channels, right now?) → **templating** (render the message per channel and locale) → **channel routing** (pick email vs push vs SMS) → **delivery providers** (the external gateways that actually send) → **status tracking** (sent, delivered, bounced, opened). A [[../messaging/message-queue|queue]] sits between ingestion and delivery so a provider outage or spike doesn't drop events, with a [[../messaging/dead-letter-queue|dead-letter queue]] for messages that exhaust retries.

## Key concerns

- **Consent and preferences** — per-user, per-channel opt-in, plus categories (marketing vs transactional) with different rules; sending without consent is a legal and trust problem.
- **Rate and frequency control** — quiet hours, per-user caps, and digesting/batching so the system informs rather than spams.
- **[[../api-design/idempotency-key|Idempotency]]** — delivery is [[../messaging/at-least-once-delivery|at-least-once]] and providers retry, so without dedup a single event can notify a user multiple times.
- **Provider failover** — external gateways fail; routing to a backup provider (or channel) keeps delivery flowing.

## Pitfalls

The signature failure is **spamming users** — a retry loop or a missing idempotency check sends the same notification repeatedly, and unlike a backend bug the user sees every instance, which erodes trust fast. Provider delivery is fire-and-mostly-forget: "sent" is not "delivered," so status must be tracked from provider callbacks, not assumed. And ignoring quiet hours / time zones turns a useful notification into a 3 a.m. buzz — frequency and timing controls are core features, not polish.
