---
title: Service mesh
description: An infrastructure layer that handles service-to-service communication via sidecar proxies.
tags:
  - architecture
  - microservices
  - networking
---

A **service mesh** is a dedicated infrastructure layer that manages traffic between services by routing every call through a sidecar proxy, moving networking concerns out of application code.

## How it works

A proxy (commonly Envoy) is deployed beside each service instance as a **sidecar**. Application code talks to its local proxy as if it were the remote service; the proxy handles the actual network hop. The mesh splits into a **data plane** — all the sidecars carrying real traffic — and a **control plane** that configures them centrally with routing rules, policies, and certificates.

With every call passing through proxies, the mesh provides **mTLS** between services automatically, plus traffic management (canary splits, retries, timeouts) and uniform observability — metrics, traces, and logs for every hop without instrumenting each app.

## When to use

Reach for a mesh when retries, timeouts, and [[circuit-breaker|circuit breaking]] would otherwise be reimplemented inconsistently across many services and languages. The mesh pushes those resilience concerns into infrastructure, alongside [[load-balancing|Load balancing]] and [[service-discovery|Service discovery]], so policy is set once and applied everywhere.

## Tradeoffs

A mesh adds real cost: an extra proxy per instance means more latency, memory, and a control plane to operate. For a handful of services it's overkill — a library or an [[api-gateway|API gateway]] is simpler. The mesh earns its keep at scale, where consistent security and observability across dozens of services outweigh the operational complexity.
