---
title: Idempotency key
description: A client-provided key that makes retried non-idempotent requests safe.
tags:
  - api
  - reliability
---

An **idempotency key** is a client-provided identifier that lets the server recognize a retried request.

It is commonly used with `POST` operations such as payments, order creation, or file finalization, where retrying could otherwise create duplicate side effects.

The server stores the result for the key and returns the same result when the same request is retried.

Idempotency keys extend the idea of [[../web/idempotency|idempotency]] to operations that are not naturally idempotent.
