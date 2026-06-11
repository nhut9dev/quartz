---
title: Soft delete
description: Marking a record as deleted without physically removing it immediately.
tags:
  - database
---

**Soft delete** keeps a row in the database but marks it as deleted, often with a `deleted_at` timestamp.

It can support restore flows, audit needs, and delayed cleanup jobs.

The tradeoff is that every query must consistently exclude deleted records unless it intentionally needs them.

Soft delete works best with clear [[schema|schema]] conventions, indexes for active rows, and a later hard-delete policy when data retention allows it.
