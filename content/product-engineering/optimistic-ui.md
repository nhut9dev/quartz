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

## How it works

The UI applies the mutation's expected result locally and immediately — before the network request resolves — typically by writing into the same cache or store the UI already reads from. When the server responds, the optimistic value is reconciled: replaced with the authoritative server value on success, or rolled back to the prior known-good snapshot on failure. With TanStack Query this is the `onMutate`/`onError`/`onSettled` lifecycle — `onMutate` snapshots the previous cache value and writes the optimistic one, `onError` restores the snapshot, and `onSettled` refetches to confirm the true state.

## When to use

Use it for actions where success is near-certain and a wrong guess is cheap and easy to reverse visually: toggling a like, checking off a todo, reordering a list, editing a display name. Avoid it for actions where failure is common or the consequences are hard to walk back — submitting a payment, creating a resource whose real ID the UI needs immediately, or anything where a visible "undo" flicker would confuse the user more than a brief loading state would.

## Trade-offs

The perceived-speed win comes at the cost of a state machine with more cases: pending-optimistic, confirmed, and rolled-back, each needing its own visual treatment. Skipping the rollback path is the most common shortcut — it works fine in demos and breaks on the first real failure, leaving the UI showing something the server never agreed to.

## Pitfalls

Two optimistic updates to the same item in quick succession can race: if update A's rollback runs after update B's optimistic write has landed, it can revert B's change too, not just A's. Optimistically creating an item with a client-generated temporary ID, then receiving a different real ID from the server, requires careful reconciliation — the item's `key` and any in-flight references to the temp ID need to migrate, or React treats it as a remove-then-add and loses focus, animation state, and scroll position.
