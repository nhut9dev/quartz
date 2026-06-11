---
title: Horizontal Pod Autoscaler
description: A Kubernetes controller that changes replica counts based on metrics.
tags:
  - kubernetes
  - autoscaling
---

**Horizontal Pod Autoscaler** is a Kubernetes controller that changes replica counts based on metrics.

HPA commonly scales a [[deployment|Deployment]] from CPU or memory metrics, and can use custom metrics such as queue length or request rate. It adjusts replicas within configured minimum and maximum bounds.

Use HPA when traffic varies and the app can safely run multiple replicas. It pairs with resource requests, [[readiness-and-liveness-probe|readiness probes]], and capacity planning.

Autoscaling is not instant. Cold starts, slow metrics, database bottlenecks, and external dependencies can still cause overload before new pods are ready.
