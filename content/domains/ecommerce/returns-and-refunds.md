---
title: Returns and refunds
description: The post-purchase workflow for sending items back and returning money to the customer.
tags:
  - domains
  - ecommerce
  - payments
---

**Returns and refunds** handle the case where a customer sends back an item, receives replacement goods, store credit, or money back.

The workflow often separates return authorization, item receipt, inspection, refund approval, and actual refund execution.

Engineering risk comes from refunding the wrong amount, issuing duplicate refunds, losing inventory state, or failing to align customer support actions with accounting records.

Related notes: [[../finance/business/reconciliation|Reconciliation]], [[../finance/engineering/audit-trail|Audit trail]], and [[../../api-design/idempotency-key|Idempotency key]].
