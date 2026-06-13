---
title: At-least-once delivery
description: A messaging guarantee where each message is delivered one or more times.
tags:
  - messaging
---

**At-least-once delivery** guarantees a message is never lost, but accepts that it may be delivered more than once.

This is the default for most reliable [[message-queue|message queues]], because retrying after an uncertain failure is what prevents loss.

## Where it comes from

The guarantee falls out of the acknowledgement protocol. A consumer pulls a message, processes it, and acks; the broker only removes the message once the ack arrives. If the ack never comes — the consumer crashed, the network dropped it, or processing ran past the visibility timeout — the broker cannot tell whether the work was done. Its only safe move is to redeliver. Choosing to redeliver guarantees no loss, at the cost of possible duplicates.

## The three delivery semantics

The order of *work* and *ack* decides the guarantee:

- **At-most-once** — ack first, then work. A crash between the two loses the message, but it is never duplicated. Simple, lossy.
- **At-least-once** — work first, then ack. A crash means redelivery, so the message is never lost but may duplicate. The common default.
- **[[exactly-once|Exactly-once]]** — neither loss nor duplicate. Not achievable across system boundaries; only *approximated* by at-least-once plus an [[idempotent-consumer|idempotent consumer]].

The choice between the first two is really a choice about which failure you'd rather have: a gap or a repeat.

## When to use

Use at-least-once whenever losing a message is worse than handling it twice — which is almost always for payments, orders, and state changes. Prefer at-most-once only when duplicates are more harmful than gaps and the data is low-value or high-volume, like metrics samples or telemetry where an occasional dropped point doesn't matter.

## Making it safe

The trap is assuming delivery equals exactly-once and writing handlers with non-idempotent side effects. A redelivered "charge card" message charges twice; a redelivered "increment counter" over-counts. The broker stays simple precisely *because* it pushes this problem onto the consumer — so the consumer must be made [[idempotent-consumer|idempotent]], either through [[message-deduplication|deduplication]] on a message or business id, or by designing operations that are naturally repeatable (set a value rather than increment it).
