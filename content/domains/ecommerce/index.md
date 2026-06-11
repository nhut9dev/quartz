---
title: Ecommerce
description: Domain notes about online commerce workflows such as catalog, cart, checkout, orders, fulfillment, and returns.
tags:
  - domains
  - ecommerce
  - index
---

**Ecommerce** systems help users discover products, buy them, pay for them, receive them, and sometimes return or exchange them.

The domain looks simple at the storefront layer, but most complexity comes from inventory accuracy, pricing rules, promotions, payment failure, fulfillment, refunds, and customer support workflows.

## Core concepts

- [[product-catalog|Product catalog]]
- [[cart|Cart]]
- [[checkout|Checkout]]
- [[order-lifecycle|Order lifecycle]]
- [[returns-and-refunds|Returns and refunds]]

## Related technical foundations

- [[../../api-design/idempotency-key|Idempotency key]]
- [[../../database/transaction|Transaction]]
- [[../../caching/cache-invalidation|Cache invalidation]]
- [[../../frontend-architecture/server-state-vs-client-state|Server state vs client state]]
