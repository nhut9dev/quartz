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

## How it works

The provider's event triggers an HTTP `POST` to your registered URL with the event payload. Your endpoint must respond quickly — typically within a few seconds — with a `2xx`; anything else (timeout, `4xx`, `5xx`) is treated as a failed delivery, and the provider retries on a backoff schedule. Heavy processing should happen *after* responding, not before, so a slow handler doesn't cause the provider to time out and retry a request you already received.

## When to use

Webhooks fit event-driven integrations where near-real-time matters and polling would mostly return "nothing changed" — payment confirmations, deployment triggers, third-party status updates.

## Trade-offs

Webhooks push complexity onto the receiver: you need a publicly reachable endpoint, signature verification, deduplication, and monitoring for delivery failures. Polling is simpler to operate — no public endpoint, no signature scheme — but laggier and wastes requests checking for events that haven't happened.

## Pitfalls

Because providers retry on timeout or non-2xx, the same event can arrive more than once — handlers must be idempotent, usually by storing the event's ID and skipping ones already processed, see [[../api/idempotency|idempotency]]. If your endpoint is down during a deploy or outage, events sent during that window may be lost unless the provider offers a replay or resend mechanism. And a handler that does significant synchronous work before responding risks the provider's timeout firing mid-processing — triggering a retry of work that already partially completed.
