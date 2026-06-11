---
title: Audit trail
description: A durable history of who changed what, when it changed, and why the change happened.
tags:
  - domains/finance
  - finance
  - engineering
  - audit
---

An **audit trail** is a durable history of changes and decisions in a system.

In financial systems, an audit trail should answer who performed an action, what changed, when it happened, which request caused it, and what business reason or workflow step justified it. It is different from ordinary application logging because it must survive debugging needs, user disputes, compliance checks, and operational review.

Audit trails should be append-oriented and difficult to tamper with. They often include actor identity, before and after values, request IDs, approval references, imported file references, and links to [[../../../observability/correlation-id|correlation IDs]].

This note connects to [[../business/ledger|Ledger]], [[../../../security/principle-of-least-privilege|Principle of least privilege]], and [[../../../observability/structured-logging|Structured logging]].
