---
title: Sales order
description: A business record that captures a customer's confirmed request to buy goods or services.
tags:
  - domains/erp
  - erp
  - sales
---

A **sales order** records a customer's confirmed request to buy goods or services.

It usually connects customer details, products, quantity, pricing, discounts, taxes, fulfillment status, and payment status. Sales orders often reserve inventory before fulfillment is complete.

The main engineering risk is treating order creation as a simple insert. Real systems need inventory reservation, pricing snapshots, cancellation rules, partial fulfillment, returns, and integration with invoicing or payment workflows.
