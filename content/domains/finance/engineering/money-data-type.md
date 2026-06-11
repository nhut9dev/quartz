---
title: Money data type
description: Representing money in software without losing precision, currency, or accounting meaning.
tags:
  - domains/finance
  - finance
  - engineering
  - data-modeling
---

A **money data type** represents an amount together with the rules needed to interpret it correctly.

Do not store money as a binary floating-point number. Use minor units such as cents, a decimal type, or a dedicated money representation depending on the database and language. The model should also store the currency because `100` has no financial meaning without knowing whether it is VND, USD, JPY, or another currency.

Important concerns include rounding rules, currency precision, exchange rates, display formatting, tax calculation, and whether an amount is gross, net, fee, discount, debit, or credit.

Money modeling connects to [[../../../database/schema|Schema]], [[../../../database/transaction|Transaction]], and [[../business/ledger|Ledger]].
