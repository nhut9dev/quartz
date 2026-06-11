---
title: Query optimization
description: The practice of making database queries faster and less expensive.
tags:
  - database
---

**Query optimization** improves how a database finds, filters, joins, and sorts data.

Typical tools include [[database-index|indexes]], limiting selected columns, avoiding unnecessary joins, reducing round trips, and checking the query plan.

A slow query is not always fixed by adding an index. Indexes speed up reads for specific access patterns, but they also cost storage and make writes slightly more expensive.

Optimize from evidence: measure the query, inspect the plan, and change the schema or query based on the actual bottleneck.
