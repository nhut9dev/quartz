---
title: OpenAPI codegen
description: Generating typed frontend clients and models from an OpenAPI contract.
tags:
  - web
  - api
  - openapi
  - typescript
---

**OpenAPI codegen** generates TypeScript types, request helpers, or full client SDKs from an [[openapi|OpenAPI]] specification.

The goal is to make the API contract executable in the frontend: endpoint paths, request bodies, query params, response models, and error shapes become compile-time feedback instead of handwritten assumptions.

## When it fits

OpenAPI codegen fits REST APIs, especially when frontend and backend are separate repos, separate teams, or different languages. It is also useful for public APIs because the same contract can power docs, mocks, tests, and generated clients.

## Workflow

The backend publishes a versioned OpenAPI document. The frontend generates types or a client during development or CI. Breaking contract changes should fail code generation, type checking, or contract tests before they reach production.

## Pitfalls

Generated clients can become awkward if the OpenAPI spec is inaccurate, too generic, or missing error responses. Treat the spec as production code, not documentation generated after the fact.

Related notes: [[openapi|OpenAPI]], [[rest|REST]], [[request-body|Request body]], [[query-params|Query params]], [[../../api-design/openapi-contract|OpenAPI contract]], and [[../../testing/contract-testing|Contract testing]].
