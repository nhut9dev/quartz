---
title: SQL injection
description: An attack where untrusted input changes the meaning of a SQL query.
tags:
  - security
---

**SQL injection** happens when untrusted input is concatenated into a SQL query, letting an attacker change what the query does.

A login form that builds `WHERE name = '` + input can be tricked into returning every row or dropping a table.

The fix is parameterized queries, also called [[../database/prepared-statement|prepared statements]], where values are sent separately from the query text.

Never build queries by string concatenation, even with [[input-validation|input validation]] in place. Validation reduces risk but is not a substitute for parameterization.

ORMs help, but raw query fragments can still reintroduce the flaw.
