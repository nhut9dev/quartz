---
title: Service discovery
description: The mechanism by which services locate the network addresses of other services.
tags:
  - architecture
  - microservices
  - networking
---

**Service discovery** is how a service finds the current network address of another service in a system where instances start, stop, and move dynamically.

## How it works

Instances register themselves in a **service registry** as they come up and deregister as they go down; **health checks** prune instances that stop responding so callers never get a dead address. Callers then query the registry by service name rather than hardcoding IPs.

Discovery comes in two shapes. In **client-side discovery**, the caller queries the registry and picks an instance itself, choosing its own [[load-balancing|Load balancing]] policy. In **server-side discovery**, the caller hits a stable endpoint — a load balancer or [[api-gateway|API gateway]] — that consults the registry and forwards the request, keeping clients simple. A common lightweight variant is **DNS-based** discovery, where the service name resolves to live instance addresses.

## When to use

Static configuration is fine for a [[monolith-vs-microservices|monolith]], but once instances scale elastically and addresses change at runtime, you need discovery. A [[service-mesh|Service mesh]] typically bundles it in, resolving destinations transparently through the sidecar so application code only ever uses logical service names.
