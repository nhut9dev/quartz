---
title: Webhook
description: A reverse API where a provider POSTs to your URL when an event happens, instead of you polling.
tags:
  - web
  - api
---

**Webhook** is a reverse API. Rather than you repeatedly polling a service for changes, the provider sends an [[http-methods|HTTP POST]] to a URL you registered whenever an event happens — a payment succeeds, a push lands, an order ships. The event comes to you, in near real time, with no wasted requests.

To receive one, you expose a public endpoint and give its URL to the provider. Because anyone could POST to that URL, you should verify each request is genuine: check the signature the provider includes, or a shared secret, before trusting the payload.

```http
POST /hooks/payment HTTP/1.1
X-Signature: sha256=...
```

Contrast this with polling a [[rest|REST]] API on a timer, which is simpler to reason about but laggy and inefficient. Signature or secret verification plays a similar role to an [[api-key|API key]]: proving the caller is who they claim to be.
