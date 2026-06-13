---
title: Cache key
description: The identifier used to store and retrieve a cached value.
tags:
  - caching
---

A **cache key** is the identifier under which one cached value is stored and looked up. Its design decides both correctness (does a key map to the right value?) and hit rate (how often can a stored value be reused?).

## What to include

A key must contain *every input that changes the output*, and nothing that doesn't. For a rendered user page that means user id, locale, relevant feature flags, and a content version; for a query result it means the filters, sort, and pagination. Anything that varies the response but is missing from the key causes one request to serve another's data; anything in the key that doesn't affect the output needlessly splits the cache into entries that can never be reused.

A version or content hash component (`product:42:v9`) doubles as an invalidation mechanism — bump it and old entries are simply never read again, which ties key design directly to [[cache-invalidation|cache invalidation]].

## The granularity trade-off

Key granularity is a dial between reuse and correctness:

- **Too broad** (missing an input) → high hit rate, but collisions serve wrong data — the dangerous failure.
- **Too narrow** (extra inputs) → always correct, but a near-zero hit rate as every request gets its own key, so the cache barely helps.

The goal is the coarsest key that's still correct.

## Pitfalls

Forgetting an input that varies per user — auth state, tenant, locale — is how a public cache leaks one user's data to another. Unbounded key dimensions (raw timestamps, free-text search, full query strings) explode the keyspace and tank the hit rate. And keys that aren't normalized (`?a=1&b=2` vs `?b=2&a=1`) cache the same result twice, halving effective reuse.
