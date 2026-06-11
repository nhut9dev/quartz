---
title: API client
description: A frontend module that centralizes how the app talks to backend APIs.
tags:
  - frontend-architecture
  - web
---

An **API client** centralizes HTTP calls, often built on the [[fetch-api|Fetch API]], from the frontend to backend services.

It usually handles base URLs, headers, auth behavior, request serialization, response parsing, and consistent error handling.

An API client should expose application-level functions, not leak raw request details everywhere.

For React apps, the API client often pairs with [[server-state|server-state]] tools such as [[../react/data-fetching/tanstack-query|TanStack Query]] or [[../react/data-fetching/swr|SWR]].

For larger apps, prefer a typed contract instead of hand-written request and response assumptions. Common options include [[type-safe-api-contract|type-safe API contracts]], [[../web/api/openapi-codegen|OpenAPI codegen]], [[../web/api/trpc|tRPC]], and [[../react/data-fetching/graphql-client|GraphQL clients]].
