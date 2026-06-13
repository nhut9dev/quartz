---
title: ORM
description: A library that maps application objects to database tables and queries.
tags:
  - database
  - backend
---

An **ORM** (Object-Relational Mapper) lets application code work with a relational database through language-level objects and methods instead of hand-written [[sql|SQL]] strings.

```js
const user = await db.user.findUnique({
  where: { email: "ada@example.com" }
})
```

## How it works

The ORM maps tables to classes/models, rows to objects, and relationships to references, then translates method calls into SQL and result rows back into objects. It bridges the **object-relational impedance mismatch** — objects have references, inheritance, and identity, while tables have foreign keys, flat rows, and set-based operations — so the developer thinks in objects while the database thinks in relations. Most ORMs add migrations, connection handling, and type-safe query builders on top.

## What it buys

Productivity and safety on the common path: less boilerplate than raw SQL, generated and type-checked queries that catch errors at compile time, schema [[migration|migrations]] tracked in code, and relationship loading without manual join wiring. For ordinary CRUD — the bulk of most applications — it's faster to write and harder to get wrong than hand-rolled SQL.

## Trade-offs

An ORM is a **leaky abstraction**: it hides SQL right up until performance or a complex query forces you to understand the SQL it generates anyway. It does *not* remove the need to know [[sql|SQL]], [[schema|schemas]], [[transaction|transactions]], and [[database-index|indexes]] — it just defers when you must. Complex analytical queries are often clearer and faster written as raw SQL than expressed through the ORM, and most ORMs provide an escape hatch precisely for that.

## Pitfalls

The signature failure is the [[n-plus-one-problem|N+1 problem]]: lazy-loaded relationships turn an innocent loop over objects into one query per row, invisibly, because `post.author` looks like property access, not a database call. ORM-generated queries can also be quietly inefficient (over-fetching columns, awkward joins), so treating the ORM as a reason *not* to inspect the [[query-plan|query plan]] is how slow queries ship. And mapping a rich object graph onto tables can tempt over-abstracted models that fight the relational grain instead of working with it.
