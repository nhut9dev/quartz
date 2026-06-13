---
title: Dead-letter queue
description: A queue for messages that could not be processed successfully.
tags:
  - messaging
---

A **dead-letter queue** (DLQ) is a separate queue that holds messages a consumer could not process after retries, so they leave the main flow without being lost.

It prevents one bad message from blocking the main [[message-queue|queue]] forever, and keeps failures visible instead of silently dropped.

## How it works

The broker (or the consumer) routes a message to the DLQ when it crosses a failure threshold: too many delivery attempts, an explicit reject/nack, or an expired TTL. The original message is moved with its metadata — often annotated with the failure reason and attempt count — so an operator can later inspect why it failed and, once the cause is fixed, *replay* it back onto the main queue.

The DLQ is plumbing, not logic: it answers "what do we do with a message we keep failing on?" by parking it somewhere safe and observable rather than redelivering it endlessly.

## When to use

Use a DLQ wherever a **poison message** — one that will fail every time, like malformed JSON or a reference to a deleted record — could otherwise be retried forever and stall a partition or starve a worker. It's standard on any [[at-least-once-delivery|at-least-once]] queue, paired with a bounded retry policy (often with [[../architecture/retry|backoff]]) so transient failures get a few honest attempts before being dead-lettered.

## Operating one

A DLQ is only as good as the process around it. "Done" no longer means "all processed" — some messages are parked aside — so the queue needs an owner, an alert on its depth, and a *tested* replay path back to the main queue once the root cause is fixed. The defining failure is treating it as a place messages go to die: without that operational loop, a DLQ silently accumulates, and a quietly growing DLQ is data loss with extra steps.

## Pitfalls

Distinguish transient from permanent failures before dead-lettering. Retrying a malformed message wastes every attempt — it will never succeed — so it should be dead-lettered fast. But dead-lettering a message that failed only because a downstream service was briefly down throws away work that the next retry would have completed. Tuning the retry count and which errors are retryable vs immediately fatal is the real design decision, not the DLQ itself.
