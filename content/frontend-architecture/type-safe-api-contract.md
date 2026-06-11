---
title: Type-safe API contract
description: Keeping frontend and backend request and response types aligned with generated or inferred contracts.
tags:
  - frontend-architecture
  - api
  - typescript
---

A **type-safe API contract** makes frontend code fail at build time when it calls the backend with the wrong input or assumes the wrong response shape.

It reduces drift between frontend and backend, especially when many screens depend on the same API model.

## Common approaches

Use [[../web/api/trpc|tRPC]] when the app is full-stack TypeScript and first-party clients can share server types.

Use [[../web/api/openapi-codegen|OpenAPI codegen]] when the backend exposes REST contracts, especially across languages or teams.

Use [[../react/data-fetching/graphql-client|GraphQL client]] code generation when the API is GraphQL and components should be typed from their operations and fragments.

## Runtime validation

TypeScript checks development-time assumptions, but runtime data still comes from the network. Validate trust boundaries on the server, and consider runtime parsing on the client for high-risk or third-party data.

## Pitfalls

Types are not a substitute for API design. A perfectly typed API can still have unclear ownership, unstable semantics, missing pagination, weak error models, or unsafe mutation behavior.

Related notes: [[api-client|API client]], [[server-state-vs-client-state|Server state vs client state]], [[../web/api/openapi|OpenAPI]], [[../web/api/graphql|GraphQL]], and [[../api-design/backward-compatibility|Backward compatibility]].
