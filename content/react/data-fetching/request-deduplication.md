---
title: Request deduplication
description: Avoiding duplicate in-flight requests for the same server state.
tags:
  - react
  - data-fetching
  - performance
---

**Request deduplication** reuses an in-flight request when multiple components ask for the same data at the same time.

Without deduplication, nested routes, repeated widgets, or fast remounts can send identical requests, waste bandwidth, and create race conditions where slower responses overwrite newer data.

## How it works

Data libraries dedupe by cache key. If a request for a key is already running, later subscribers attach to the same promise instead of starting another network call.

Manual fetching can dedupe with an in-flight request map, but that logic quickly grows into caching, cancellation, retries, and invalidation. For shared server state, a dedicated library is usually simpler.

## Pitfalls

Deduplication only works when keys are stable. Object literals, unstable filter ordering, or missing identity fields can accidentally create different keys for the same resource.

Related notes: [[query-key|Query key]], [[manual-fetching|Manual fetching]], [[tanstack-query|TanStack Query]], and [[../../dom/abort-controller|AbortController]].
