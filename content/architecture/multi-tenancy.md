---
title: Multi-tenancy
description: Serving many isolated customers from one application while keeping their data separate.
tags:
  - architecture
  - database
---

**Multi-tenancy** is one running system serving multiple customers (tenants) so that each sees only its own data, while infrastructure and code are shared to keep cost and operations manageable.

## Isolation models

There is a spectrum from cheapest to most isolated:

- **Shared schema, tenant column** — every table carries a `tenant_id`; one database holds all tenants. Cheapest and simplest to operate, but isolation depends entirely on every query filtering correctly. Highest blast radius if that filter is ever missed.
- **Schema per tenant** — one database, separate schema (or table set) per tenant. Stronger separation, easier per-tenant backup, but schema migrations must fan out across every tenant.
- **Database per tenant** — full physical isolation, easy to move a noisy tenant to its own hardware or region. Highest cost and operational overhead; thousands of tenants become unmanageable.

Many systems combine these: shared schema for small tenants, dedicated databases for large or regulated ones.

## Enforcing isolation

A forgotten `WHERE tenant_id = ?` leaks one customer's data to another — the defining failure of multi-tenancy. Push the check below the application: Postgres **row-level security** policies, a repository layer that injects the tenant filter automatically, or [[connection-pool|connection]] routing that pins a request to the right database. Pair this with [[principle-of-least-privilege|least privilege]] so a compromised tenant context cannot widen its scope.

## Pitfalls

The **noisy neighbour** problem: one tenant's heavy load degrades everyone on shared infrastructure, which is why per-tenant rate limits and sometimes [[sharding|sharding]] tenants across databases matter. Per-tenant customization (custom fields, configs) tends to erode the shared schema over time. And aggregate reporting across tenants gets harder the more isolated the storage is.
