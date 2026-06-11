---
title: Idempotency
description: A request is idempotent when repeating it has the same effect as making it once.
tags:
  - web
  - api
---

**Idempotency** means a request can be made many times with the same effect as making it once. Among [[http-methods|HTTP methods]], `GET`, `PUT`, and `DELETE` are idempotent, while `POST` is not — each `POST` tends to create another resource.

This matters most for safe retries. If a network error hides the response, a client cannot tell whether the request arrived; for an idempotent call it can simply retry without fear of double effects. To extend that safety to non-idempotent operations, [[rest|REST]] APIs accept an idempotency key on `POST` requests like payments, so a retry after a dropped reply charges the customer only once — useful alongside [[rate-limiting|rate limiting]] where clients back off and try again.

```http
POST /payments
Idempotency-Key: order_123_payment
```

The server stores the result for that key. If the same request arrives again, it returns the original result instead of creating a second payment.

Idempotency is about the effect on server state, not whether the response bytes are identical. Repeating `DELETE /sessions/abc` may return `204` the first time and `404` later, but the final state is still "the session is gone."
