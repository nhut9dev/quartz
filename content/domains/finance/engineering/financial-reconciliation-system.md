---
title: Financial reconciliation system
description: A system that imports, normalizes, matches, classifies, and resolves financial records from multiple sources.
tags:
  - domains/finance
  - finance
  - reconciliation
  - engineering
---

A **financial reconciliation system** imports records from multiple financial sources and determines whether they agree.

The system usually has five parts: import external files or APIs, normalize records into a common shape, match records using deterministic identifiers and fallback rules, classify differences, and provide a resolution workflow.

Matching should prefer stable IDs over fuzzy matching. Amount, currency, direction, timestamp, status, provider reference, invoice ID, payout ID, and ledger entry ID are common matching fields. Timing differences should be modeled explicitly because settled records may arrive later than internal events.

Pitfalls include overwriting raw imported data, losing file provenance, treating all mismatches as bugs, and making matching rules impossible to explain. Reconciliation depends on [[../business/reconciliation|Reconciliation]], [[../../../observability/structured-logging|Structured logging]], and [[../../../api-design/request-validation|Request validation]].
