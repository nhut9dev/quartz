---
title: Dead-letter queue
description: A queue for messages that could not be processed successfully.
tags:
  - messaging
---

A **dead-letter queue** stores messages that a consumer could not process after retries or validation failures.

It prevents one bad message from blocking the main [[message-queue|queue]] forever.

Dead-lettered messages should be observable, searchable, and tied to an owner who can inspect or replay them.

A dead-letter queue is a failure-handling tool, not a place to silently hide data loss.
