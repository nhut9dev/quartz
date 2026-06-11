---
title: Message deduplication
description: Detecting repeated messages so repeated delivery does not repeat side effects.
tags:
  - messaging
---

**Message deduplication** prevents duplicate message delivery from causing duplicate work.

Consumers often store a message id or business id after successful processing and ignore the same id later.

Deduplication is important because many messaging systems prefer reliable delivery over exactly-once behavior.

It pairs with [[../web/idempotency|idempotency]] so retries can be safe.
