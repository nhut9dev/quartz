---
title: Repository
description: Abstracting data access behind a collection-like interface.
tags:
  - design-patterns
---

The **repository** pattern hides data access behind a collection-like interface, so the rest of the app reads and writes objects without knowing the storage details.

A repository exposes methods like `findById`, `save`, and `delete`, while the underlying source (SQL, a document store, or an HTTP API) stays hidden.

Use it to centralize queries, swap data sources without touching business logic, and make code easy to test with in-memory fakes.

The tradeoff is an extra abstraction that can feel redundant for simple CRUD over a single table.

On the frontend, an [[../frontend-architecture/api-client|API client]] often plays the same role, wrapping network calls behind a clean interface.
