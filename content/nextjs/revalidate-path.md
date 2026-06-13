---
title: revalidatePath
description: Invalidating cached data and rendered output for a specific Next.js route path.
tags:
  - nextjs
  - caching
---

`revalidatePath` tells Next.js that cached data and rendered output for a path should be refreshed.

It is commonly used after a [[server-action|Server Action]] changes data that appears on a page.

This gives apps a framework-level way to connect mutations with cache invalidation.

Use it when the affected route path is known; use tag-based invalidation when several pages depend on the same data group.

## How it works

Next.js can cache both the data a [[server-component|Server Component]] fetches and the rendered output of a route (the "full route cache"). `revalidatePath("/posts/123")` marks both of those as stale for that path — the *next* request to it triggers a fresh render with fresh data, rather than serving the cached version. It doesn't immediately re-render anything itself; it flags the cache so the next visit does the work.

## When to use

Call it from a [[server-action|Server Action]] (or Route Handler) right after a mutation, for every path whose displayed data the mutation affects — editing a post invalidates `/posts/123` and possibly `/posts` (the list). Reach for `revalidateTag` instead when the same underlying data appears on multiple, not-easily-enumerable paths — tag the relevant `fetch` calls once, then invalidate by tag instead of listing every path.

## Trade-offs

Path-based invalidation is direct and easy to reason about for a single page, but it couples the mutation's code to knowledge of *every* UI route that shows that data — add a new page that displays the same record, and you must remember to add its path to the invalidation call too. Tag-based invalidation decouples this (the page that fetches data declares its own tag; the mutation just invalidates the tag) at the cost of needing tags applied consistently across all relevant `fetch` calls up front.

## Pitfalls

The most common symptom of a *missing* `revalidatePath`/`revalidateTag` call is a mutation that "doesn't work" — the database updated correctly, but the page the user is redirected to still shows the old value because it served from cache. This often gets debugged as a data/mutation bug when it's purely a caching omission. Conversely, calling `revalidatePath` for a path that wasn't cached in the way you expect does nothing harmful, but also nothing useful — it can mask the real issue if the actual cause is elsewhere (e.g. client-side data not being refetched).
