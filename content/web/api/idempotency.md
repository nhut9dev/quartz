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

## How it works

The server stores a mapping from idempotency key to result. The first request with a given key processes normally and stores its outcome (success or error) keyed by that value. Any later request with the same key skips reprocessing entirely and returns the stored result — the operation runs at most once, no matter how many times the client retries.

## When to use

Add idempotency keys to any non-idempotent endpoint that a client might retry automatically — payment creation, order placement, sending an email or notification. The riskier and more visible a duplicate would be, the stronger the case for a key, especially when paired with [[rate-limiting|rate limiting]] and backoff that make retries common.

## Trade-offs

Storing results per key adds storage and a TTL decision: too short, and a slow retry that arrives after expiry creates a duplicate anyway; too long, and the store grows with every request a client ever made. Most APIs pick a window long enough to cover realistic retry storms (minutes to a day) and document it.

## Pitfalls

Two concurrent requests with the same key can both arrive before the first finishes — without a lock or an "in-progress" marker, both proceed and the operation still runs twice. A second pitfall is key reuse with a *different* payload: if a client sends the same idempotency key for a different amount or recipient, returning the cached result silently ignores the new request's intent, so the server should validate the payload matches or reject the mismatch. Finally, client-generated keys need enough entropy (a UUID, not a counter) to avoid accidental collisions across unrelated requests from different users.
