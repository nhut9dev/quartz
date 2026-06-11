---
title: Invoice
description: A request for payment that states what was sold, who owes money, how much is due, and when it should be paid.
tags:
  - domains/finance
  - finance
  - billing
---

An **invoice** is a formal request for payment.

It usually identifies the buyer, seller, line items, taxes, discounts, total amount, payment terms, due date, and status. The invoice is not the same as the payment; it is the claim that money is owed.

Invoice workflows often include draft, issued, partially paid, paid, overdue, voided, and credited states. State changes need clear rules because invoices affect revenue reporting, collections, customer communication, and accounting.

Implementation work often touches [[../../../database/transaction|transactions]], [[../../../api-design/request-validation|request validation]], permissions, audit history, and integrations with payment or accounting systems.
