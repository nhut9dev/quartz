---
title: Optimistic UI
description: Updating the interface before the server confirms a mutation.
tags:
  - product-engineering
  - frontend
---

**Optimistic UI** updates the interface before the server confirms a mutation.

It makes interactions feel fast for actions that are likely to succeed, such as liking, starring, toggling, or editing local-looking fields.

The tradeoff is rollback complexity. The UI needs a way to revert, reconcile, or mark the item as failed if the server rejects the change.

Optimistic UI works best with idempotent operations, clear mutation status, and predictable cache updates in tools like [[../react/data-fetching/tanstack-query|TanStack Query]].
