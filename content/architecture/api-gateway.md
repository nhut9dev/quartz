---
title: API gateway
description: A service entry point that routes client requests to backend services.
tags:
  - architecture
  - api
---

An **API gateway** sits in front of backend services and handles client-facing request routing.

It may centralize authentication, [[rate-limiting|rate limiting]], protocol translation, request shaping, and routing. In this role it resembles a [[reverse-proxy|reverse proxy]] with added application-level concerns.

Gateways are useful in service-oriented systems, but they can become a bottleneck if too much business logic accumulates there.
