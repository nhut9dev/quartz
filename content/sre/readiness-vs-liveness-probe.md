---
title: Readiness vs liveness probe
description: The difference between checking whether a service can receive traffic and whether it should be restarted.
tags:
  - sre
  - kubernetes
---

**Readiness** and **liveness** probes answer different operational questions.

A readiness probe asks whether a service instance can receive traffic. A failing readiness probe should remove the instance from load balancing.

A liveness probe asks whether the instance is stuck and should be restarted. A failing liveness probe can kill the process.

Mixing them up can cause outages. Slow startup, dependency issues, or temporary overload should usually affect readiness before liveness.
