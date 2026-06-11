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
