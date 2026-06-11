---
title: Cart
description: A temporary shopping state that holds selected items before checkout.
tags:
  - domains
  - ecommerce
---

A **cart** stores the items a customer intends to buy before an order is created.

Cart data is not the final contract. Prices, promotions, inventory, shipping options, and taxes must be recalculated or validated at checkout because they can change while the cart is open.

Important design choices include anonymous carts, account carts, cart merging after login, expiration, promotion application, and whether inventory is reserved before payment.

Related notes: [[../../frontend-architecture/server-state-vs-client-state|Server state vs client state]], [[../../product-engineering/optimistic-ui|Optimistic UI]], and [[../../database/optimistic-locking|Optimistic locking]].
