---
title: Reconciliation
description: Comparing financial records from different sources to find matches, mismatches, missing records, and timing differences.
tags:
  - domains/finance
  - finance
  - reconciliation
---

**Reconciliation** compares financial records from two or more sources to prove that they agree or to explain why they do not.

Common comparisons include internal ledger entries versus bank statements, payment provider exports, invoices, payouts, refunds, or settlement reports. A mismatch does not always mean a bug; it can be caused by timing, fees, rounding, currency conversion, chargebacks, or delayed settlement.

Good reconciliation classifies differences instead of only flagging them. Examples include matched, missing internally, missing externally, amount mismatch, duplicate, pending settlement, and expected timing difference.

The engineering version is [[../engineering/financial-reconciliation-system|Financial reconciliation system]], which depends heavily on stable identifiers, [[../../../api-design/idempotency-key|idempotency]], import pipelines, and [[../../../observability/structured-logging|structured logging]].
