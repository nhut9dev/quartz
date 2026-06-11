---
title: Type-safe RPC
description: An RPC style where the client calls server functions and types are inferred across the boundary with no separate schema or codegen.
tags:
  - web
  - api
  - rpc
---

**Type-safe RPC** is an [[rpc|RPC]] style where the client calls server procedures directly and the input and output types flow across the network boundary automatically — the server's function signatures *are* the contract.

## How it works

The server defines procedures in a typed language; the client imports those types (not the implementation) and calls them. The compiler then checks argument shapes, return shapes, and renames at build time, so a breaking change on the server fails the client build instead of failing in production. Crucially there is no intermediate schema file and no code generation step — the types come straight from inference.

## When to use

This shines for first-party clients where server and client share one language and ship together, typically a monorepo. You trade the ceremony of a wire schema for instant, always-accurate types. [[trpc|tRPC]] is the canonical TypeScript implementation.

## Tradeoffs

The contract is implicit and language-specific, so it does not suit public or multi-language APIs the way [[rest|REST]] with [[openapi|OpenAPI]] or [[graphql|GraphQL]] do — those generate inspectable, language-neutral contracts that external consumers can integrate against. It also differs from [[grpc|gRPC]], which is cross-language but reaches type safety through a `.proto` schema and codegen rather than inference. Type-safe RPC couples deployments: client and server types must move in lockstep, so versioning across independently deployed services gets awkward.
