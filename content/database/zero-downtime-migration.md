---
title: Zero-downtime migration
description: Evolving a database schema while old and new application code run at the same time.
tags:
  - database
  - deployment
---

A **zero-downtime migration** changes a schema without taking the application offline, by ensuring every intermediate state is compatible with both the currently deployed code and the version being rolled out.

## The expand–contract pattern

A breaking change is split into reversible steps that are deployed separately:

1. **Expand** — add the new structure without removing the old: a nullable new column, a new table, a new index built concurrently. Old code ignores it; the schema stays backward compatible.
2. **Migrate** — deploy code that writes to both old and new, and backfill existing rows in batches so the new structure becomes fully populated.
3. **Contract** — once all running instances use the new structure and the backfill is done, drop the old column or table in a later release.

Each step is small, independently deployable, and safe to roll back, which is what makes it compatible with [[blue-green-deployment|blue-green]] and [[canary-deployment|canary]] releases where two code versions serve traffic at once.

## Pitfalls

The dangerous operations are the ones that take a long lock: rebuilding a table, adding a non-nullable column with a default on older engines, or building an index non-concurrently — these block writes for the duration. Renaming a column is never atomic with code, so model it as add-new + dual-write + drop-old rather than a single `RENAME`. Always make migrations forward-only in spirit but reversible in mechanics, and keep [[backward-compatibility|backward compatibility]] across at least one release so a rollback never meets a schema it cannot read.
