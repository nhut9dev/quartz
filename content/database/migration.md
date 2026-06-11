---
title: Migration
description: A versioned database change that updates schema over time.
tags:
  - database
---

A **migration** is a versioned change to a database schema. Migrations let a team evolve tables, columns, constraints, and indexes in a controlled order.

```sql
ALTER TABLE users ADD COLUMN last_login_at timestamp;
```

Migrations should be reviewed carefully because database changes can affect existing data and running applications. A good migration plan considers both applying and rolling back the change.
