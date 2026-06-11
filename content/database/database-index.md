---
title: Database index
description: A data structure that helps a database find rows faster.
tags:
  - database
  - performance
---

A **database index** helps a database find rows faster without scanning an entire table.

```sql
CREATE INDEX users_email_idx ON users (email);
```

Indexes speed up reads for matching queries, sorting, and joins. They also have tradeoffs: each index uses storage and can make writes slower because the database must keep the index updated.

Add indexes based on real query patterns, not just every column.
