---
title: Load balancing
description: Distributing traffic across multiple backend instances.
tags:
  - architecture
  - deployment
---

**Load balancing** distributes incoming requests across multiple server or service instances, so no single instance is overloaded while others sit idle. It's a core enabler of [[horizontal-vertical-scaling|horizontal scaling]] and of availability.

## How it works

A load balancer sits in front of a pool of instances and, for each request, picks one to forward it to. It continuously runs **health checks** against the pool and routes only to instances that pass, so a crashed or unresponsive instance is taken out of rotation automatically — that's where the availability gain comes from. A [[reverse-proxy|reverse proxy]] often doubles as the load balancer.

Balancers operate at different layers: **L4** (transport) routes by IP/port without inspecting content — fast, protocol-agnostic; **L7** (application) reads HTTP and can route by path, header, or cookie — richer, slightly costlier.

## Strategies

- **Round robin** — rotate through instances in order; simple, assumes requests are roughly equal.
- **Least connections** — send to the instance with the fewest active connections; better when request durations vary.
- **Hashing** — route by a hash of client IP or a key, so the same client consistently lands on the same instance.
- **Health/latency-based** — weight toward instances responding fastest or with most spare capacity.

## Pitfalls

**Sticky sessions** (pinning a client to one instance for in-memory session state) undermine even balancing and break when that instance dies — externalize session state so any instance can serve any request, and you won't need stickiness. Health checks that are too shallow (a TCP connect) route traffic to an instance whose app is broken; too aggressive and they flap instances in and out under load. And the balancer is itself a single point of failure unless it's made redundant. Applications behind it must still handle [[retry|retries]], [[timeout|timeouts]], and instance failures, because being balanced doesn't make individual calls reliable.
