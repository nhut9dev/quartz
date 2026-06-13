---
title: Infinite scroll
description: Loading more content as the user reaches the end of a list.
tags:
  - product-engineering
  - frontend
---

**Infinite scroll** loads more content as the user approaches the end of a list.

It works well for feeds and discovery surfaces where users browse without a fixed target. It is weaker for admin tables, search results that need stable positions, and tasks that require footer access.

Good infinite scroll needs stable sorting, cursor pagination, loading indicators, error recovery, and scroll position preservation.

It is usually backed by [[../api-design/pagination-strategy|cursor pagination]] and often uses [[../dom/intersection-observer|IntersectionObserver]].

## How it works

A sentinel element near the end of the list is observed with IntersectionObserver; when it enters the viewport, the app fetches the next page using a cursor derived from the previous response and appends the results below the existing items. Because new items are appended rather than replacing the list, the user's scroll position stays put while the page grows underneath them.

## When to use

Infinite scroll fits feeds where users scan forward and rarely need to return to a specific position — social feeds, image grids, activity logs. It's a poor fit when users need to reach the footer, compare items across pages, share a link to "page 3", or rely on browser back/forward to return to where they were — all of which infinite scroll makes awkward without extra engineering.

## Trade-offs

Compared to traditional pagination, infinite scroll removes a click but adds engineering cost: restoring scroll position on back-navigation, avoiding duplicate or skipped items when the underlying data shifts between page loads (an item inserted at the top moves every later cursor), and managing an ever-growing DOM that eventually needs [[../frontend-performance/virtualization|virtualization]] to stay smooth.

## Pitfalls

Returning to an infinite-scroll list via the browser back button typically resets it to page one at the top, discarding the user's place — a frequent complaint in feed UIs that don't explicitly restore state. If new items can be inserted at the top of the list while the user has scrolled down — a live feed — naive cursor pagination can return overlapping or duplicate items, or skip items entirely, because the cursor's position shifted underneath the request. And without virtualization, a long enough session accumulates thousands of DOM nodes until the page itself becomes the bottleneck, regardless of how fast each page loads.
