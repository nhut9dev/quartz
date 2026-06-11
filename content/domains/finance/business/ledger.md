---
title: Ledger
description: A financial record that tracks debits, credits, balances, and the history of money movement.
tags:
  - domains/finance
  - finance
  - accounting
---

A **ledger** is the financial record of money movement and balances.

In accounting systems, a ledger should explain how a balance was produced, not only store the latest number. That history matters for audits, disputes, chargebacks, refunds, and operational debugging.

Many financial systems use a double-entry model: every movement creates balanced debit and credit entries. This makes it easier to detect impossible states, because money should not appear or disappear without a matching entry.

Engineering notes that depend on this concept include [[../engineering/double-entry-ledger-system|Double-entry ledger system]], [[../engineering/audit-trail|Audit trail]], and [[../../../database/transaction|Transaction]].
