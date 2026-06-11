---
title: HTTP status codes
description: Three-digit codes that summarize a response by class.
tags:
  - web
  - http
---

**HTTP status codes** are three-digit numbers that summarize an [[http|HTTP]] response, grouped by class. `2xx` means success (200 OK, 201 Created, 204 No Content). `3xx` means redirection (301 Moved Permanently, 304 Not Modified). `4xx` means client error (400, 401, 403, 404, 409, 422, 429). `5xx` means server error (500, 503).

The class is the first thing a client checks, so picking the code that matches what actually happened lets callers react correctly — retry, re-authenticate, or surface a message. For example, 429 signals [[rate-limiting|rate limiting]] and invites a client to back off.

Accurate codes are part of what makes a [[rest|REST]] API predictable.

Some common choices:

```txt
200 OK                  request succeeded
201 Created             resource was created
204 No Content          success with no response body
400 Bad Request         malformed or invalid request
401 Unauthorized        authentication is missing or invalid
403 Forbidden           authenticated, but not allowed
404 Not Found           resource does not exist
409 Conflict            request conflicts with current state
422 Unprocessable       validation failed
500 Internal Error      unexpected server failure
```

Do not use `200 OK` for every response and hide errors inside the body. Clients, proxies, logs, retries, and monitoring all rely on the status code before they inspect application-specific JSON.
