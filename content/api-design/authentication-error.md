---
title: Authentication error
description: API error responses for missing, invalid, or insufficient credentials.
tags:
  - api
  - auth
  - security
---

An **authentication error** tells a client that credentials are missing, invalid, expired, or insufficient.

Use `401 Unauthorized` when authentication is required or invalid. Use `403 Forbidden` when the caller is authenticated but not allowed to perform the action.

The response should help legitimate clients recover without leaking sensitive detail. Pair this with [[error-response-format|error response format]], [[../auth/session-vs-token|Session vs token]], and [[../security/principle-of-least-privilege|least privilege]].
