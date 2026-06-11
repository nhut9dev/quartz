---
title: Drizzle
description: A SQL-first ORM where the schema lives in TypeScript and queries read like SQL.
tags:
  - database
  - orm
  - typescript
---

**Drizzle** is a SQL-first [[orm|ORM]] for TypeScript: you declare tables in code, and its query builder mirrors SQL closely while inferring types directly from those declarations.

## How it works

You define your schema as plain TypeScript objects, and Drizzle infers row and result types from them, no separate codegen step needed. The query builder maps almost one-to-one onto SQL clauses, so `select`, `where`, and `join` look like the statements they produce. There is little to no runtime layer: queries compile to [[sql|SQL]] that you can read and predict, which keeps the mental gap between code and database small.

```ts
const result = await db
  .select()
  .from(users)
  .where(eq(users.email, "ada@example.com"))
```

## Tradeoffs

Compared to [[prisma|Prisma]], Drizzle has less magic and stays closer to SQL. There is no query engine and no generated client, so what you write is essentially what runs. That transparency is the appeal: easier to reason about performance and to drop into raw SQL. The cost is that you do more of the wiring yourself, and you need to actually know SQL to be productive rather than leaning on a high-level API.

## When to use

Choose Drizzle when you value control and predictability over convenience, when you are comfortable thinking in SQL, or when a thin runtime matters for edge and serverless environments.
