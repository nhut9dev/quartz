---
title: OpenAPI
description: A standard, machine-readable specification that describes a REST API.
tags:
  - web
  - api
---

**OpenAPI** is a standard, machine-readable specification — written in YAML or [[json|JSON]] and formerly called Swagger — that describes a [[rest|REST]] API: its endpoints, parameters, request and response schemas, and authentication.

The point is that one document becomes the single source of truth. From that spec you can generate interactive docs, client SDKs in many languages, and request validation, keeping the API and its documentation in sync instead of drifting apart. It also lets teams agree on a contract before any code is written, so frontend and backend can build against the same shape in parallel.

```yaml
paths:
  /users/{id}:
    get:
      parameters:
        - name: id
          in: path
          required: true
      responses:
        "200":
          description: A user
```

OpenAPI describes the contract; it does not implement the server. A backend still has to route the request, run business logic, and return the documented [[http-status-codes|status codes]] and response bodies.
