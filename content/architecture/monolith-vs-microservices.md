---
title: Monolith vs microservices
description: A comparison between one deployable application and many independently deployable services.
tags:
  - architecture
---

A **monolith** keeps most application behavior in one deployable unit.

**Microservices** split behavior into separate services that can be deployed and scaled independently.

Microservices add network boundaries, operational overhead, data consistency challenges such as [[eventual-consistency|eventual consistency]], and observability needs. They often communicate through a [[message-queue|message queue]] to stay loosely coupled.

Start with the simplest architecture that fits team size, domain boundaries, and operational maturity.
