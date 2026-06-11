---
title: Exactly-once
description: Why true exactly-once delivery is impractical, and how idempotency approximates it.
tags:
  - messaging
---

**Exactly-once** is the ideal that each message is delivered and processed precisely one time, no losses and no duplicates.

In a distributed system this is effectively impossible to guarantee end to end. A sender that gets no acknowledgment cannot tell whether the message was lost or the acknowledgment was, so it must choose between risking a loss or risking a duplicate.

That choice yields at-most-once or [[at-least-once-delivery|at-least-once delivery]]. Most systems pick at-least-once, accepting duplicates as the safer failure mode.

The practical answer is at-least-once delivery plus an [[idempotent-consumer|idempotent consumer]]: duplicates still arrive, but processing them twice has no extra effect, so the observable result is exactly-once.

Frameworks advertising "exactly-once" usually mean this combination, scoped within their own boundary.
