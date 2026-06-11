---
title: SQL
description: A language for querying and changing data in relational databases.
tags:
  - database
  - sql
---

**SQL** is a language for querying and changing data in relational databases.

```sql
SELECT id, email
FROM users
WHERE active = true
ORDER BY created_at DESC;
```

SQL works with tables, rows, columns, joins, constraints, and transactions. Even when an app uses an [[orm|ORM]], understanding SQL helps explain what the database is actually doing.
