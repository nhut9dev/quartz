---
title: CRUD
description: The four basic operations on persistent data — Create, Read, Update, Delete.
tags:
  - web
  - api
---

**CRUD** names the four basic operations on persistent data: Create, Read, Update, and Delete. Almost any application that stores records does some mix of these, so they form a checklist for what an interface must support.

In a [[rest|REST]] API they map onto [[http-methods|HTTP methods]] — `POST` creates, `GET` reads, `PUT`/`PATCH` update, and `DELETE` removes. That correspondence makes CRUD a quick mental model for designing resource endpoints: pick the resource, then provide the verbs you actually need. Not every resource needs all four; a read-only feed may expose only the read.

For a `users` resource, the CRUD shape often looks like this:

```http
POST /users       create a user
GET /users/42     read one user
PATCH /users/42   update part of a user
DELETE /users/42  delete a user
```

CRUD is a starting point, not the whole API design. Some actions are better modeled as domain operations, such as `POST /invoices/42/pay`, because "paying" an invoice is more specific than simply updating a field.
