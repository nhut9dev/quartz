---
title: Type-safe routing
description: Using typed route params, search params, and navigation APIs to make URL state safer.
tags:
  - react
  - routing
  - typescript
---

**Type-safe routing** makes route paths, params, search params, and navigation calls visible to TypeScript.

This matters because URL state is global, bookmarkable, shareable, and often used as input for data fetching. A wrong route param or malformed search param can break a whole screen.

## What to type

Route params should have known names and shapes. Search params should be parsed and validated instead of treated as an unstructured string bag. Links and redirects should be checked against known route definitions.

## Data fetching

Typed route inputs pair well with query keys. If the route owns `tenantId`, `projectId`, filters, or pagination state, those values should flow predictably into the data fetching layer.

## Pitfalls

Do not put all UI state in the URL. Use search params for state that should survive refresh, back/forward navigation, sharing, or deep linking. Keep short-lived interaction state local.

Related notes: [[tanstack-router|TanStack Router]], [[route-params|Route params]], [[../data-fetching/query-key|Query key]], and [[../../frontend-architecture/state-location|State location]].
