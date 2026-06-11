---
title: tRPC
description: A TypeScript-first RPC framework for building end-to-end type-safe APIs without a separate schema or code generation step.
tags:
  - web
  - api
  - rpc
  - typescript
---

**tRPC** is a TypeScript-first [[rpc|RPC]] framework that lets a frontend call backend procedures with end-to-end inferred types.

The main idea is that the server router is the source of truth. The client imports the router type, so procedure names, input shapes, output shapes, and many errors are checked by TypeScript during development.

## When it fits

tRPC fits best when the frontend and backend live in the same TypeScript codebase or monorepo, and the API is mostly consumed by first-party clients.

It is especially common with full-stack TypeScript apps using Next.js, TanStack Query, Zod validation, and shared packages.

## What it replaces

tRPC can remove the need for a separate OpenAPI or GraphQL schema for internal app APIs. It also removes a code generation step because the contract comes from TypeScript inference.

## Pitfalls

tRPC is less suitable when non-TypeScript clients need a stable public contract. It also couples the client to backend TypeScript types, so package boundaries, versioning, and deployment coordination matter.

For large apps, keep routers organized around product domains. Do not expose low-level service methods directly as procedures.

Related notes: [[rpc|RPC]], [[openapi|OpenAPI]], [[graphql|GraphQL]], [[../../typescript/generics|Generics]], [[../../react/data-fetching/tanstack-query|TanStack Query]], and [[../../react/forms/zod|Zod]].
