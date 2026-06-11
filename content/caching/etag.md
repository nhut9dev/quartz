---
title: ETag
description: An HTTP validator used to check whether a cached response is still current.
tags:
  - caching
  - web
---

An **ETag** is an [[http-headers|HTTP response header]] that identifies a specific version of a resource.

Clients can send it back with `If-None-Match` to ask whether their [[caching|cached]] copy is still valid.

If unchanged, the server can return `304 Not Modified` without sending the full response body.
