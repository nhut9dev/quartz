---
title: ORM
description: A library that maps application objects to database tables and queries.
tags:
  - database
  - backend
---

An **ORM** (Object-Relational Mapper) helps application code work with a relational database using language-level objects and methods.

```js
const user = await db.user.findUnique({
  where: { email: "ada@example.com" }
})
```

ORMs can improve productivity with type-safe queries, migrations, relationships, and generated models. They do not remove the need to understand [[sql|SQL]], [[schema|schemas]], [[transaction|transactions]], and indexes.
