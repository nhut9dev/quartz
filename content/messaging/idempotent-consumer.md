---
title: Idempotent consumer
description: A consumer that produces the same result no matter how many times it processes a message.
tags:
  - messaging
---

An **idempotent consumer** can process the same message more than once without changing the outcome beyond the first time.

This matters because most message systems offer [[at-least-once-delivery|at-least-once delivery]]: retries and redeliveries mean duplicates are normal, not exceptional.

A common approach records each handled message's id and skips any id already seen, often called [[message-deduplication|deduplication]]. Alternatively, the operation itself can be made naturally idempotent, such as setting a value rather than incrementing it.

Without idempotency, a redelivered "charge card" message charges twice; with it, the duplicate is a harmless no-op.

Idempotency is the practical foundation for approximating [[exactly-once|exactly-once]] processing and for safely retrying in a [[saga|saga]].
