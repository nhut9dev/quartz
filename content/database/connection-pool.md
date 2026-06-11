---
title: Connection pool
description: A reusable set of database connections shared by an application.
tags:
  - database
  - backend
---

A **connection pool** keeps a reusable set of database connections for an application.

Opening a new database connection for every request is expensive. A pool lets requests borrow existing connections and return them after the query finishes.

Pool size matters. Too small can create request queues; too large can overload the database. Production apps usually tune pool settings based on traffic and database limits.
