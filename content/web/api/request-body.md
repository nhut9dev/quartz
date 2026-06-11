---
title: Request body
description: Data sent in the body of an HTTP request.
tags:
  - web
  - http
  - api
---

A **request body** is data sent after the [[http-headers|headers]] of an [[http|HTTP]] request. It is common with methods that create or change data, especially `POST`, `PUT`, and `PATCH`.

```http
POST /users
Content-Type: application/json

{"name":"Ada","email":"ada@example.com"}
```

APIs usually parse JSON request bodies into objects before a [[controller|controller]] reads them. In Express, that parsing is done by [[../express/json-middleware|express.json()]] middleware.

Do not trust request bodies just because they are valid JSON. The server still needs validation, authorization, and clear error responses.
