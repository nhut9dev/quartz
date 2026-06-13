---
title: Table design
description: Designing data tables for scanning, comparison, and repeated work.
tags:
  - product-engineering
  - frontend
---

**Table design** focuses on scanning, comparison, filtering, and repeated action over structured records.

Useful tables make important columns visible, align numeric data, preserve row identity, and keep sorting, filtering, selection, and pagination predictable.

Tables should define empty, loading, error, filtered, and permission states instead of only the happy path.

Large tables often need [[../frontend-performance/virtualization|virtualization]], [[../api-design/pagination-strategy|pagination]], and careful accessibility support.

## How it works

A table's state is really several independent pieces — sort order, active filters, pagination cursor, column visibility, and row selection — that all need to interact correctly. Changing a filter should typically reset pagination to page one; whether it should preserve selection depends on whether the selected rows are still in the result set. Row identity, usually a stable record ID rather than an array index, is what lets selection, sorting, and re-fetching stay coherent as the underlying data set changes shape.

## When to use

Server-side sorting, filtering, and pagination become necessary once the data set is too large to load entirely — the table becomes a view into a query, and every interaction becomes a new request. For small, fully-loaded data sets, client-side sorting and filtering are simpler and instant, with no round trip per interaction.

## Trade-offs

Selection that persists across pages — "select all 10,000 matching rows" versus "select all 50 on this page" — is far more useful for bulk actions, but requires representing selection as a set of IDs (or an "all except these IDs" inverse selection) rather than a per-row checkbox flag, which only works for what's currently rendered. The simpler per-page selection model is easier to implement but constantly surprises users who expect "select all" to mean everything that matches the current filter.

## Pitfalls

If sorting or filtering changes while rows are selected, IDs that scroll out of view are easy to silently drop from the selection if it's stored as page-local state rather than a persistent ID set — a user selects rows, changes a filter, comes back, and finds their selection gone with no explanation. Virtualized tables compound this: row components are recycled, so any local component state — an inline edit draft, a hover flag — tied to the DOM node rather than the row's ID reappears on the wrong row after scrolling, see [[../frontend-performance/virtualization|virtualization]].
