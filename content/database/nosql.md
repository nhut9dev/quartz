---
title: NoSQL
description: A broad category of non-relational database models such as document and key-value stores.
tags:
  - database
---

**NoSQL** is an umbrella term for databases that don't use the relational table-and-join model, typically trading some of SQL's flexibility and guarantees for scale, schema flexibility, or a data model that fits a specific access pattern.

## The families

"NoSQL" covers several quite different models:

- **Document** (MongoDB, DynamoDB) — stores JSON-like documents; flexible schema, good when data is read and written as self-contained objects.
- **Key-value** (Redis, DynamoDB) — a giant hash map; extremely fast lookups by key, minimal query ability beyond the key.
- **Wide-column** (Cassandra, HBase) — rows with flexible columns, optimized for huge write volumes and queries along a known partition key.
- **Graph** (Neo4j) — nodes and edges; built for traversing relationships (social graphs, recommendations) that are painful as SQL joins.

## When to use

The honest framing: pick NoSQL for a *specific reason*, not by default. Document stores fit evolving or heterogeneous schemas and aggregate-oriented access; key-value fits caching and simple high-throughput lookups; wide-column fits write-heavy time-series/event data at scale; graph fits relationship-traversal queries. The deciding questions are the query shape, the consistency needs, the scale, and how the access patterns will change.

## Pitfalls

NoSQL is often chosen for "scale" it doesn't need, giving up SQL's joins, ad-hoc queries, and [[acid|ACID]] transactions for a problem a well-indexed relational database handled fine — modern SQL databases scale much further than the NoSQL marketing implies. **Schema-less is not schema-free**: the schema moves from the database into application code, and inconsistent documents become the app's problem to handle. Many NoSQL stores default to weaker consistency ([[../architecture/eventual-consistency|eventual consistency]]), so reads can be stale in ways a relational default wouldn't be. And modeling is **query-first** — you must design the data around the exact queries up front, because the flexible ad-hoc querying SQL gives you for free often isn't there.
