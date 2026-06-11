---
title: Endpoint
description: A specific API address that accepts requests for a resource or action.
tags:
  - web
  - api
---

An **endpoint** is a specific API address a client can call. It combines an [[http-methods|HTTP method]] with a URL pattern, such as `GET /users/42` or `POST /payments`.

```http
GET /api/products?limit=20
```

In a [[rest|REST]] API, endpoints usually expose resources and operations around those resources. The URL identifies the target, while the method states the intent.

An endpoint is not the same as a function. A single endpoint may pass through [[web/backend/middleware|middleware]], a [[controller|controller]], validation, service logic, database access, and response formatting before the client receives anything.
