---
title: Join
description: A SQL operation that combines rows from related tables.
tags:
  - database
  - sql
---

A **join** combines rows from two or more tables based on a relationship.

```sql
select users.name, orders.total
from users
join orders on orders.user_id = users.id;
```

Joins let relational databases avoid duplicating the same data in many places. For example, an order can store `user_id` instead of copying the user's name and email into every order row.

The most common join is an inner join, which returns matching rows from both tables. Left joins keep all rows from the left table even when the right table has no match.
