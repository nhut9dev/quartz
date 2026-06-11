---
title: Prisma
description: A type-safe ORM built around a declarative schema file and a generated client.
tags:
  - database
  - orm
  - typescript
---

**Prisma** is an [[orm|ORM]] where you describe your data model in a single declarative schema file, and Prisma generates a fully typed client from it.

## How it works

You define models, fields, and relations in `schema.prisma`. Running the generator produces a client whose methods and return types match your schema exactly, so the editor knows the shape of every query result. The same schema drives [[migration|migrations]]: Prisma diffs it against the database and emits SQL to bring the two in sync. At runtime, queries go through a query engine that translates client calls into SQL and maps rows back to typed objects.

```ts
const user = await prisma.user.findUnique({
  where: { email: "ada@example.com" },
  include: { posts: true },
})
```

## When to use

Prisma shines when you want strong type-safety and a smooth developer experience without hand-writing SQL for common queries. The schema-as-source-of-truth model keeps types, migrations, and the database aligned, which is valuable on teams and in fast-moving codebases.

## Pitfalls

The query engine adds a layer of indirection between your code and the database, so debugging slow queries means inspecting the generated SQL. Loading relations carelessly across a list causes the [[n-plus-one-problem|N+1 problem]]; reach for nested reads or batched queries instead. When the high-level API cannot express a query, drop to the raw-SQL escape hatch rather than fighting the abstraction.
