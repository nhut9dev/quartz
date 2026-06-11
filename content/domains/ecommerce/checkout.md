---
title: Checkout
description: The workflow that turns a cart into a paid or payable order.
tags:
  - domains
  - ecommerce
  - payments
---

**Checkout** turns a cart into an order by collecting address, shipping method, billing details, payment intent, tax calculation, and final confirmation.

Checkout must be defensive because users refresh pages, payment providers retry webhooks, inventory can change, and networks fail at awkward moments.

Good checkout systems separate order creation from payment confirmation and use idempotency to avoid duplicate charges or duplicate orders.

Related notes: [[../../api-design/idempotency-key|Idempotency key]], [[../finance/engineering/idempotent-payment|Idempotent payment]], and [[../../web/security/session-cookie-auth|Session cookie auth]].
