---
title: Load balancing
description: Distributing traffic across multiple backend instances.
tags:
  - architecture
  - deployment
---

**Load balancing** distributes requests across multiple servers or service instances.

It improves capacity and availability by avoiding a single overloaded instance, and is a core part of [[horizontal-vertical-scaling|horizontal scaling]].

A [[reverse-proxy|reverse proxy]] often doubles as a load balancer. They can use strategies such as round robin, least connections, hashing, or health-based routing.

Applications should still be designed to handle retries, timeouts, and instance failures.
