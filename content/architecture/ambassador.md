---
title: Ambassador
description: A sidecar that proxies an app's outbound calls and owns the client-side networking logic.
tags:
  - architecture
  - microservices
  - networking
---

An **ambassador** is a [[sidecar|Sidecar]] variant that intercepts an application's outbound calls, handling retries, timeouts, routing, and circuit-breaking on the app's behalf so client logic lives outside the app code.

## How it works

The application sends requests to its local ambassador as if calling the remote service directly. The ambassador resolves the destination, applies a [[retry|Retry]] policy, enforces timeouts, and trips a [[circuit-breaker|Circuit breaker]] when the downstream is failing. The app sees a simple local endpoint; the ambassador absorbs the messy realities of the network.

This is the outbound counterpart to a plain proxy sidecar: it owns *how the app reaches others*, not how others reach the app.

## When to use

Use an ambassador to standardize resilient client behavior across services without baking it into every language's HTTP client — especially when connecting to flaky or legacy endpoints, or when you want one place to change routing and connection policy. At fleet scale this logic is what a service mesh's data plane provides automatically.

## Tradeoffs

It adds a network hop and a process to operate per instance, and debugging spans two components instead of one. For a single service with a good client library, inline resilience is simpler; the ambassador pays off when the same policy must apply uniformly and language-agnostically.
