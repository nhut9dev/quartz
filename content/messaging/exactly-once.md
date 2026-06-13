---
title: Exactly-once
description: Why true exactly-once delivery is impractical, and how idempotency approximates it.
tags:
  - messaging
---

**Exactly-once** is the ideal that each message is delivered and processed precisely one time — no losses, no duplicates. In a distributed system, true end-to-end exactly-once *delivery* is effectively impossible; what's achievable is exactly-once *processing*, approximated by combining at-least-once delivery with idempotency.

## Why it's impossible

The wall is the **two generals** problem at the ack boundary. A sender transmits a message and waits for an acknowledgment. If no ack arrives, it cannot distinguish three cases: the message was lost, the message arrived but the ack was lost, or both are merely slow. With no way to tell, the sender must choose one of two policies — and each is a different failure mode.

- Ack *before* processing → **at-most-once**: a crash loses the message, never duplicates.
- Process *before* ack → **[[at-least-once-delivery|at-least-once]]**: a crash redelivers, never loses.

There is no third option that avoids both. Most systems choose at-least-once, treating duplicates as the safer failure than loss.

## How it's approximated

The practical recipe is **at-least-once delivery + an [[idempotent-consumer|idempotent consumer]]**. Duplicates still physically arrive, but processing the same message twice has no effect beyond the first, so the *observable* result is exactly-once. The duplicate is absorbed at the consumer through [[message-deduplication|deduplication]] on a stable id, or by making the operation naturally repeatable (set a value instead of incrementing).

## When the guarantee holds

Frameworks that advertise "exactly-once" (Kafka transactions, for example) mean it *within their own boundary* — a closed loop of consume, process, and produce back into the same system, coordinated by transactional offsets. The guarantee evaporates the moment a side effect leaves that boundary: calling an external payment API or sending an email is outside the transaction, so those must still be made idempotent by you.

## Pitfalls

The dangerous misread is taking "exactly-once" on a vendor's box as license to write non-idempotent handlers. The label is scoped and conditional; cross a system boundary and you're back to at-least-once. Treating idempotency as optional because the broker "guarantees exactly-once" is how a redelivery during a failover quietly double-charges a customer.
