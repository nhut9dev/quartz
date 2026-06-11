---
title: HTTP methods
description: The verbs that state a request's intent.
tags:
  - web
  - http
---

**HTTP methods** are the verbs that state a request's intent over [[http|HTTP]]: `GET` reads, `POST` creates, `PUT` replaces, `PATCH` partially updates, and `DELETE` removes.

Two properties matter when choosing one. `GET` is safe — it should never change server state. And `GET`, `PUT`, and `DELETE` are [[idempotency|idempotent]] — repeating the same request has the same effect as sending it once — while `POST` is not, since each call tends to create another resource.

[[rest|REST]] leans on these verbs directly, mapping them onto [[crud|CRUD]] operations so the method, not the URL, says what to do.

```http
GET /posts          list posts
POST /posts         create a post
PUT /posts/42       replace post 42
PATCH /posts/42     update part of post 42
DELETE /posts/42    remove post 42
```

Use nouns in the URL and let the method carry the action. `POST /posts` is usually clearer than `GET /createPost`, because intermediaries, clients, and humans can understand the request's intent from standard HTTP semantics.
