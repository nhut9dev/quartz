---
title: Sidecar
description: A helper process deployed alongside the main app to handle cross-cutting concerns.
tags:
  - architecture
  - microservices
---

A **sidecar** is a separate process or container that runs beside the main application, sharing its lifecycle and host while offloading cross-cutting concerns like proxying, logging, configuration, or TLS termination.

## How it works

The sidecar is co-located with the app — in Kubernetes, in the same [[../k8s/pod|Pod]], sharing its network and storage. The application stays focused on business logic and talks to the sidecar over localhost; the sidecar handles the infrastructural work transparently. Because they share a lifecycle, they start, stop, and scale together as one unit.

This keeps the concern out of application code while still running close enough to share resources. The same sidecar can attach to apps written in different languages, since it communicates over the network rather than via a library.

## When to use

Reach for a sidecar when a cross-cutting concern must be applied uniformly across many services regardless of language — TLS, observability, config reloading, or outbound proxying (an [[ambassador|Ambassador]] is a sidecar specialized for outbound calls). Repeated at scale, this pattern becomes the data plane of a [[service-mesh|Service mesh]].

## Tradeoffs

Each sidecar adds memory, latency, and an extra moving part per instance. For a single app, a library is simpler. The pattern earns its cost when the same concern would otherwise be reimplemented inconsistently across a fleet.
