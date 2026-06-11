---
title: Settlement
description: The process where a financial obligation becomes final and funds are transferred or made available.
tags:
  - domains/finance
  - finance
  - payments
---

**Settlement** is the point where a financial obligation becomes final enough to update balances, release funds, or close an obligation.

Authorization, capture, clearing, and settlement are different stages in many payment flows. A user may see a payment as successful before money has actually settled between institutions.

Systems need to model settlement timing because refunds, disputes, payout availability, fees, and reconciliation often depend on the settled state rather than the initial payment request.

Settlement connects to [[reconciliation|Reconciliation]], [[../engineering/idempotent-payment|Idempotent payment]], and [[../../../architecture/eventual-consistency|Eventual consistency]].
