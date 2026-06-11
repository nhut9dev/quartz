---
title: Readiness and liveness probe
description: Kubernetes health checks that decide whether a pod can receive traffic or should be restarted.
tags:
  - kubernetes
  - reliability
---

**Readiness and liveness probe** are Kubernetes health checks that decide whether a [[pod|pod]] can receive traffic or should be restarted.

Readiness answers "should this pod receive traffic?" Liveness answers "should this pod be restarted?" Startup probes can protect slow-starting apps from premature liveness failures.

Use readiness for dependencies, warmup, migrations, and overload states. Use liveness only for unrecoverable deadlocks or stuck processes where restart is better than waiting.

The pitfall is making liveness too aggressive. Restarting a slow but recovering app can turn a transient problem into an outage.
