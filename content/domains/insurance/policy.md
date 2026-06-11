---
title: Policy
description: The insurance contract that defines coverage, limits, exclusions, parties, and effective dates.
tags:
  - domains
  - insurance
---

A **policy** is the insurance contract that defines who is covered, what is covered, coverage limits, exclusions, deductibles, premiums, and effective dates.

Policy data is time-sensitive. A claim must be evaluated against the policy version that was active when the insured event happened, not necessarily the latest policy version.

Systems should preserve policy history and avoid overwriting contractual facts that affect coverage or auditability.

Related notes: [[../../api-design/api-versioning|API versioning]], [[../../database/transaction|Transaction]], and [[../finance/engineering/audit-trail|Audit trail]].
