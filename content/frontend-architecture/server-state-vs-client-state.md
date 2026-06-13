---
title: Server state vs client state
description: Distinguishing remote application data from local interface state.
tags:
  - frontend-architecture
  - react
---

**Server state** is data owned by a backend, such as users, orders, permissions, and search results.

**Client state** is local interface state, such as selected tabs, open dialogs, draft inputs, and temporary filters.

Mixing them makes caching, invalidation, loading states, and updates harder to reason about.

Libraries such as [[../react/data-fetching/tanstack-query|TanStack Query]] are designed for server state, while local React state is often enough for client state.

## How it works

The distinction is about *who owns the data and when it can change underneath you*. Client state is synchronous and exclusively yours — if a dialog is open, it stays open until your code closes it. Server state is asynchronous, can be stale the moment you receive it (another user or process can change it server-side), and is shared across sessions — "the current value" is really "the value as of the last fetch." Treating server data as `useState` means your component now owns a private copy that nothing keeps in sync with the server unless you write that logic yourself.

## When to use

Anything fetched from an API — and that other parts of the app might also fetch, or that can change server-side — belongs in a server-state tool (TanStack Query, SWR, Apollo's cache): it gives you caching by key, deduplication of concurrent requests for the same data, refetch-on-focus/reconnect, and invalidation primitives. Anything that exists only in this browser tab and has no server representation — is a dropdown open, which tab is selected, unsaved draft text — is plain client state, and a dedicated library adds nothing for it.

## Trade-offs

A server-state library means learning its caching vocabulary (query keys, stale time, invalidation) and adding a dependency — but it replaces a surprisingly large amount of hand-written "loading flag, error flag, refetch function, ignore-stale-response" logic that's easy to get subtly wrong per-feature. Plain `useState` for server data looks simpler at first (one hook, no library), but the missing pieces — staying in sync across components that fetch the same data, revalidating after a mutation, deduplicating simultaneous fetches — tend to get reinvented inconsistently, feature by feature.

## Pitfalls

The classic bug is a mutation that succeeds on the server but the UI keeps showing the pre-mutation `useState` value, because nothing told that state to refetch — the fix usually becomes an ad hoc `setData(newValue)` after the mutation, which now has to be duplicated everywhere that data is shown. The opposite mistake is putting genuinely local UI state (a dialog's open/closed flag, a form's draft value) into a global server-state cache or store — it works, but adds global surface area and cache-key management for something only one component will ever read, see [[state-location|state location]].
