---
title: HATEOAS
description: A REST constraint where responses embed links and actions so clients navigate the API by following relations.
tags:
  - web
  - api
  - rest
---

**HATEOAS** (Hypermedia As The Engine Of Application State) is the [[rest|REST]] constraint where each response carries the links and actions available next, so the client discovers what it can do by following relations instead of hardcoding URLs.

## How it works

A resource representation includes hypermedia controls — typically a `_links` or `links` block naming related resources and state transitions by relation, not by literal path.

```json
{ "id": 42, "status": "open",
  "_links": { "self": "/orders/42", "cancel": "/orders/42/cancel" } }
```

The client knows relation names (`self`, `cancel`) but treats the URLs as opaque, following whatever the server returns. The presence or absence of a link expresses state: a shipped order simply omits `cancel`. This is **level 3** of the Richardson maturity model, the top rung above resources and [[http-methods|HTTP methods]].

## Why it's rarely adopted

In theory this decouples clients from URL structure and lets the server evolve its layout freely. In practice almost no API goes this far. Clients still need out-of-band knowledge of relation names and payload shapes, so the promised "self-describing" client rarely materializes; teams find it simpler to publish an [[openapi|OpenAPI]] contract and let clients build URLs directly. The extra link plumbing adds payload size and server work for benefit most consumers never use. Most APIs that call themselves RESTful deliberately stop at level 2.
