---
title: Message queue
description: A system that stores messages until consumers process them.
tags:
  - messaging
---

A **message queue** lets producers send work that consumers process later.

Queues help absorb spikes, decouple services, and move slow work out of request paths, which makes them a building block for [[event-driven|event-driven]] systems.

Consumers should handle retries, duplicate messages through [[idempotency|idempotency]], ordering requirements, and dead-letter behavior.
