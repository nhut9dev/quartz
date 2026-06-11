---
title: Double-entry ledger system
description: A financial system design where each money movement is recorded as balanced debit and credit entries.
tags:
  - domains/finance
  - finance
  - accounting
  - engineering
---

A **double-entry ledger system** records each money movement as balanced debit and credit entries.

The key invariant is that every transaction balances. If one account is debited, another account is credited by the corresponding amount. This gives the system a built-in consistency check and makes financial history easier to audit.

The implementation usually separates immutable ledger entries from derived balances. Balances may be cached for fast reads, but the ledger remains the source of truth. Balance updates should be protected by [[../../../database/transaction|transactions]], appropriate [[../../../database/isolation-level|isolation levels]], and duplicate prevention.

Common failure modes include editing historical entries instead of reversing them, storing only current balances, mixing currencies in the same balance, and allowing partial writes that break the debit-credit invariant.
