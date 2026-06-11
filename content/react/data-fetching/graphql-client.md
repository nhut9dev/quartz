---
title: GraphQL client
description: Managing typed GraphQL operations, normalized data, fragments, and cache behavior in frontend apps.
tags:
  - react
  - graphql
  - data-fetching
---

A **GraphQL client** sends [[../../web/api/graphql|GraphQL]] operations from the frontend and manages the result lifecycle: loading states, errors, caching, normalization, fragments, and pagination.

Common choices include Apollo Client, urql, Relay, and lightweight clients combined with TanStack Query.

## Operation types

Frontend GraphQL code should be typed from actual operations, not only from the server schema. The schema says what is possible; the operation says what this screen actually requested.

Code generation can produce typed query documents, variables, response data, and fragment helpers so components do not guess field availability.

## Fragments

Fragments let UI components declare the data shape they need. This keeps large screens from passing loosely typed objects through many layers and makes missing fields easier to catch.

## Pitfalls

GraphQL does not automatically make caching simple. Normalized caches need stable IDs and careful mutation updates. Non-normalized clients often pair better with explicit query keys and invalidation.

Related notes: [[../../web/api/graphql|GraphQL]], [[query-key|Query key]], [[cache-invalidation|Cache invalidation]], [[tanstack-query|TanStack Query]], and [[../../web/api/dataloader|DataLoader]].
