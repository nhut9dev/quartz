---
title: Prepared statement
description: A parameterized SQL statement that separates query structure from values.
tags:
  - database
  - security
---

A **prepared statement** sends SQL structure separately from user-provided values.

```sql
select * from users where email = ?;
```

Prepared statements reduce SQL injection risk because values are treated as data, not executable SQL.

They can also improve performance when the database can reuse a query plan.
