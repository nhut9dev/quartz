---
title: Audit log
description: An append-only record of who did what, when, used for security forensics and compliance.
tags:
  - security
  - observability
---

An **audit log** records security- and business-significant actions — who performed them, what changed, and when — as an immutable trail that answers "what happened to this record, and who is responsible?"

## What it is not

An audit log is different from application logs. [[structured-logging|Application logs]] are for debugging and are noisy, sampled, and short-lived. An audit log is a deliberate, durable record of *accountable* events: logins and failures, permission changes, data exports, deletions, admin actions, access to sensitive records. It is typically required by compliance regimes (SOC 2, GDPR, HIPAA) and read by humans during an incident, not by a profiler.

## Design

Each entry captures actor (user or service identity), action, target resource, timestamp, source (IP, request [[correlation-id|correlation ID]]), and a before/after snapshot where it matters. The store must be **append-only**: writes only, no updates or deletes, so a compromised account cannot erase its own tracks. That often means a separate datastore with restricted write-only credentials, sometimes write-once storage or cryptographic chaining (each entry hashes the previous) to make tampering detectable.

## Pitfalls

Logging sensitive values directly turns the audit log into a breach target, so redact or reference rather than copy secrets and PII, and apply [[encryption-at-rest|encryption at rest]]. Capturing audit events inside the same transaction as the action keeps them consistent but couples them; capturing them asynchronously (often via [[change-data-capture|change data capture]]) risks gaps if the pipeline drops events. And without a retention policy the log grows without bound — define how long entries are kept based on the compliance requirement driving them.
