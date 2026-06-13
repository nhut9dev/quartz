---
title: Queue-based architecture
description: Using queues to decouple producers and consumers so work can be processed asynchronously.
tags:
  - system-design
  - messaging
---

A **queue-based architecture** places a [[../messaging/message-queue|message queue]] between the system that accepts work and the system that performs it, so the two run at their own pace instead of in lockstep.

## How it works

The producer's job ends at *enqueuing* the work; it doesn't wait for the work to finish, and returns to the caller immediately. Consumers pull from the queue and process at whatever rate they can sustain. This decoupling delivers three things at once: it **absorbs spikes** (a burst of work piles up in the queue and drains steadily rather than overwhelming the workers), it **isolates slowness** (a slow consumer backs up its queue without blocking the producer or unrelated paths), and it makes **retries** natural (a failed message goes back for another attempt instead of failing the original request).

## When to use

It fits any work that doesn't need to finish before the user gets a response: email and notification delivery, image/video processing, billing and report generation, third-party integrations, and bulk imports. The test is "can the caller be told 'accepted, we'll handle it' rather than waiting for the result?" — if yes, a queue decouples the slow part from the request path.

## Pitfalls

The architecture inherits every messaging hazard at system scale. Delivery is [[../messaging/at-least-once-delivery|at-least-once]], so consumers must be [[../messaging/idempotent-consumer|idempotent]] or retries double-process. Poison messages need a [[../messaging/dead-letter-queue|dead-letter queue]] or they block progress. Ordering is not guaranteed by default, so logic that assumes "A before B" must enforce it. And the queue makes overload *invisible* until you watch it — a backlog growing faster than it drains is the early warning of a capacity problem, so queue depth and consumer lag must be monitored, not assumed healthy because nothing errored.
