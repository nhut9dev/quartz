---
title: Foreign key
description: A database constraint that links a row to a row in another table.
tags:
  - database
---

A **foreign key** stores a reference to another table and asks the database to enforce that the referenced row exists.

For example, `orders.user_id` can reference `users.id`. That prevents an order from pointing at a user that does not exist.

Foreign keys help preserve data integrity at the database layer, not just in application code. They are especially useful for ownership, parent-child records, and many-to-one relationships.
