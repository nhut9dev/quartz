---
title: Outbox pattern
description: A pattern for reliably publishing events after database changes.
tags:
  - messaging
  - database
---

The **outbox pattern** stores an event in the same database [[transaction|transaction]] as the state change.

A separate process reads the outbox table and publishes events to a broker or [[message-queue|message queue]]. Consumers still need [[idempotency|idempotency]] in case an event is published more than once.

This avoids the failure window where the database commit succeeds but event publishing fails.
