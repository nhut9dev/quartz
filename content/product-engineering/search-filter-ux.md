---
title: Search and filter UX
description: Helping users narrow large result sets without losing context.
tags:
  - product-engineering
  - ux
  - search
---

**Search and filter UX** helps users find the right item in a large set.

Search works best for known terms. Filters work best for structured attributes such as status, owner, date, category, or price. Sorting answers a different question: what order should results appear in?

Good interfaces show active filters, result counts, empty states, and a quick way to reset. For technical design, see [[../system-design/search-indexing|Search indexing]].

## How it works

As the user types or changes filters, the app debounces the input — waits for a short pause, typically 200-400ms — before issuing a request, so a fast typist doesn't trigger one request per keystroke. The current search term and active filters are usually synced to the URL query string, making the view shareable, bookmarkable, and restorable via browser back/forward — the URL becomes the source of truth, and the UI derives its state from it rather than the other way around.

## When to use

Debounced server-side search and filtering fits large or server-owned data sets where the full set can't be sent to the client. Client-side filtering — instant, no debounce needed — fits small, already-loaded data sets, like a settings list or a command palette over a few hundred items, where a network round trip would be slower than filtering in memory.

## Trade-offs

Syncing filter state to the URL makes views shareable and gives free back/forward navigation, but every filter change becomes a URL change — which can spam browser history unless incremental updates use `replaceState` rather than `pushState`, reserving `pushState` for more significant navigations. Debouncing trades a small input lag for far fewer requests; too short a delay and fast typists still spam the server, too long and the UI feels unresponsive.

## Pitfalls

With debounced async search, responses can return out of order: if a fast first request resolves *after* a more recent request for different terms, the UI can briefly show stale results for the old query unless responses are matched against the latest request — commonly handled with [[../dom/abort-controller|AbortController]] cancellation or a request sequence number checked before rendering. A second pitfall is restoring filters from the URL on initial load but not keeping them in sync afterward — a user who changes a filter, then hits back, expects to see the previous filter state, not the state frozen at page load.
