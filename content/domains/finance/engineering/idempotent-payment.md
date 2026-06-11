---
title: Idempotent payment
description: Designing payment operations so retries do not create duplicate charges, transfers, refunds, or ledger entries.
tags:
  - domains/finance
  - finance
  - payments
  - engineering
---

An **idempotent payment** operation can be retried without creating duplicate financial effects.

Payments fail in ambiguous ways: the client may time out after the provider accepted the charge, a webhook may arrive twice, or a worker may retry after a partial database write. Idempotency protects the system from turning retries into duplicate charges or duplicate ledger entries.

Use a stable [[../../../api-design/idempotency-key|idempotency key]] for external requests and a unique business identifier for internal effects. Persist the request state, response, and resulting financial records so the retry can return the same outcome instead of performing the operation again.

The main pitfall is making only the API request idempotent while leaving downstream effects non-idempotent. Ledger entries, webhooks, notifications, payouts, and reconciliation imports also need duplicate protection.
