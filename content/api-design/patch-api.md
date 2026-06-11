---
title: PATCH API
description: An API design for applying partial updates to a resource.
tags:
  - api
  - http
---

A **PATCH API** updates part of a resource instead of replacing the whole resource.

It is useful when clients edit a few fields, but it requires clear rules for missing fields, explicit nulls, validation, concurrency, and idempotency.

Two common styles are merge patch, where the body resembles the resource, and operation patch, where the body lists changes. Pick one and document it in the [[openapi-contract|OpenAPI contract]].
