---
title: N+1 problem
description: A query pattern where one initial query triggers many additional queries.
tags:
  - database
---

The **N+1 problem** happens when one query loads a list of records and then one more query runs for each record.

For example, loading 50 posts and then querying the author for each post creates 51 queries.

This often appears with ORMs and lazy-loaded relationships.

Fixes include joins, eager loading, batching, and query planning around the actual data needed by the screen or API.
