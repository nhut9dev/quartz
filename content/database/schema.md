---
title: Schema
description: The structure of database tables, columns, relationships, and constraints.
tags:
  - database
---

A database **schema** describes the structure of stored data: tables, columns, types, relationships, indexes, and constraints.

For a user table, the schema might define an `email` column as required and unique. That rule belongs in the database because the data must stay valid even if multiple application servers write to it.

Schema design affects correctness, query complexity, and performance.
