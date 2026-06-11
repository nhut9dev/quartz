---
title: REST
description: An architectural style for web APIs built around resources, URLs, and HTTP methods.
tags:
  - web
  - api
---

**REST** is an architectural style for web APIs over [[http|HTTP]]. Data is modeled as resources, each identified by a URL and manipulated with [[http-methods|HTTP methods]]: `GET` to read, `POST` to create, `PUT`/`PATCH` to update, `DELETE` to remove. Responses are representations, usually [[json|JSON]].

```http
GET /users/42 HTTP/1.1
Accept: application/json
```

## Conventions that make it RESTful

Noun-based resource paths (`/users/42/orders`, not `/getOrders`), proper [[http-status-codes|status codes]] to signal outcomes, and a stateless server that keeps no client session between requests. It maps cleanly onto [[crud|CRUD]], and because each resource has a stable URL, responses are simple to cache. The formal yardstick is the Richardson maturity model — resources, then HTTP methods, then hypermedia (HATEOAS) — though most "REST" APIs in practice stop at the methods level.

## Pitfalls

The common drift is RPC-in-disguise: verbs in URLs and everything as `PO` returning `200` with an error inside. Fixed per-resource responses cause **over-fetching** (fields you don't need) and **under-fetching** (several round trips for one screen) — the gap [[graphql|GraphQL]] targets. Ignoring status codes makes clients parse bodies to detect failure. And mind method semantics: `PUT` should be [[idempotency|idempotent]], so it must replace, not append. Plan [[../api-design/api-versioning|versioning]] before the first breaking change, not after.
