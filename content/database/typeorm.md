---
title: TypeORM
description: A decorator-based ORM supporting both Active Record and Data Mapper patterns.
tags:
  - database
  - orm
  - typescript
---

**TypeORM** is an [[orm|ORM]] where entities are classes annotated with decorators, and you can work with them through either the Active Record or the Data Mapper pattern.

## How it works

You define an entity as a class and mark columns and relations with decorators like `@Entity`, `@Column`, and `@OneToMany`. TypeORM reads this metadata to build the schema and run queries. In the Active Record style, the entity itself carries persistence methods (`user.save()`). In the Data Mapper style, persistence lives in a [[../design-patterns/repository|Repository]] that operates on plain entities, keeping domain logic separate from storage. Changes tracked within a transaction are coordinated through a [[../design-patterns/unit-of-work|Unit of work]] before being flushed to the database.

```ts
@Entity()
class User {
  @PrimaryGeneratedColumn() id: number
  @Column() email: string
}
```

## Tradeoffs

TypeORM is mature and feature-rich, with built-in migrations and broad database support. That maturity comes with weight: the decorator and metadata machinery is heavy, and the project carries a somewhat legacy feel with known rough edges. The dual-pattern flexibility is powerful but can confuse teams that mix styles inconsistently.

## When to use

Reach for TypeORM in established Node projects already invested in decorators, or when you specifically want a Data Mapper architecture with repositories. For greener fields, weigh it against lighter, more modern alternatives.
