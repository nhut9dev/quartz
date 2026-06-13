---
title: API gateway
description: A service entry point that routes client requests to backend services.
tags:
  - architecture
  - api
---

An **API gateway** is a single entry point that sits in front of many backend services, routing each client request to the right one and handling the cross-cutting concerns that would otherwise be duplicated in every service.

In this role it resembles a [[reverse-proxy|reverse proxy]] with added application-level concerns.

## What it handles

The gateway centralizes the work every service would otherwise repeat: authentication and token validation, [[rate-limiting|rate limiting]], routing and service discovery, protocol translation (e.g. external REST to internal gRPC), request/response shaping, and TLS termination. Services behind it can then assume requests are already authenticated and well-formed, and focus on business logic.

A common extension is **aggregation** — the gateway fans one client request out to several services and composes the responses, sparing a mobile or web client many round-trips (closely related to the [[backend-for-frontend|backend-for-frontend]] pattern).

## When to use

It earns its place once you have enough services that duplicating auth, rate limiting, and routing across all of them becomes the bigger cost. For a single service or a small system, a gateway is premature — a [[load-balancing|load balancer]] or plain reverse proxy covers the need without the extra hop and component to operate.

## Pitfalls

The defining failure is the gateway accreting **business logic** until it becomes a distributed monolith's worst part — a shared component that every team must change and that no team owns. Keep it to routing and cross-cutting concerns, not domain rules. It's also a single point of failure and a latency tax on every request, so it must be highly available and fast; and centralizing auth there means a gateway misconfiguration can expose every service at once.
