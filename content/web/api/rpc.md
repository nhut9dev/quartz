---
title: RPC
description: An API style where the client calls named server procedures instead of manipulating resources directly.
tags:
  - web
  - api
  - rpc
---

**RPC** means Remote Procedure Call: the client calls a named operation on a server, usually with structured input and output.

Unlike [[rest|REST]], which models resources and HTTP semantics, RPC usually models application actions directly: `createInvoice`, `sendInvite`, `calculateQuote`, or `archiveProject`.

## When it fits

RPC works well for product workflows that are command-like and do not map cleanly to CRUD resources. It can also improve developer experience when the client and server share a type system or generated contract.

## Trade-offs

RPC can make client code feel direct, but it can also hide HTTP concerns such as caching, status codes, idempotency, and rate limiting. Public APIs often still benefit from REST or GraphQL because their contracts are easier for external consumers to inspect and integrate.

## Pitfalls

Avoid turning every backend function into a public client call. The API surface should still represent stable product capabilities, not internal implementation details.

Related notes: [[trpc|tRPC]], [[grpc|gRPC]], [[rest|REST]], [[graphql|GraphQL]], and [[idempotency|Idempotency]].
