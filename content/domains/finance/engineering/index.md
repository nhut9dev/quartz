---
title: Finance engineering knowledge
description: Software engineering notes for building financial systems with precision, consistency, auditability, and failure handling.
tags:
  - domains
  - finance
  - engineering
  - index
---

**Finance engineering knowledge** covers the technical decisions that make financial systems correct, explainable, and recoverable.

Financial software is sensitive because small implementation mistakes can create wrong balances, duplicate charges, broken reports, or audit gaps. The engineering notes here should connect domain rules to concrete system behavior.

## Core notes

- [[money-data-type|Money data type]]
- [[idempotent-payment|Idempotent payment]]
- [[audit-trail|Audit trail]]
- [[double-entry-ledger-system|Double-entry ledger system]]
- [[financial-reconciliation-system|Financial reconciliation system]]

## Related technical foundations

- [[../../../database/transaction|Transaction]]
- [[../../../database/isolation-level|Isolation level]]
- [[../../../api-design/idempotency-key|Idempotency key]]
- [[../../../observability/correlation-id|Correlation ID]]
- [[../../../security/principle-of-least-privilege|Principle of least privilege]]
