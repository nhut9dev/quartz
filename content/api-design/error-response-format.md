---
title: Error response format
description: A consistent response shape for API failures.
tags:
  - api
  - web
---

An **error response format** is the standard shape an API returns when a request fails.

A useful error response includes a machine-readable code, a human-readable message, field-level validation details when relevant, and a request or correlation id for debugging.

```json
{
  "error": {
    "code": "invalid_email",
    "message": "Email is invalid",
    "field": "email"
  }
}
```

Consistent errors make clients simpler and connect naturally with [[../observability/correlation-id|correlation ids]], [[request-validation|request validation]], and [[../web/http-status-codes|HTTP status codes]].
