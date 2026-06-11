---
title: Cache-aside
description: A caching pattern where application code loads and updates the cache around the database.
tags:
  - caching
---

**Cache-aside** is a [[caching|caching]] pattern where the application checks the cache first, loads from the database on a miss, then stores the result in the cache.

It is simple and common for read-heavy data.

The application is responsible for [[cache-invalidation|invalidating]] or refreshing cached values when source data changes.
