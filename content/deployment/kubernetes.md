---
title: Kubernetes
description: An orchestrator that runs and manages containers across a cluster of machines.
tags:
  - deployment
---

**Kubernetes** is a container orchestrator that schedules, scales, and heals containerized workloads across a pool of machines.

You describe the desired state, such as "run three replicas of this service," and Kubernetes continuously works to match reality to that declaration.

It handles scheduling containers onto nodes, restarting ones that crash, replacing unhealthy ones using a [[health-check|health check]], and scaling replica counts up or down with demand.

This self-healing, declarative model is its core value: operators manage intent rather than individual processes.

The tradeoff is significant complexity. Running [[docker|Docker]] containers directly is far simpler; Kubernetes earns its weight only at scale or with many services.

The fuller Kubernetes map lives in [[../k8s/|Kubernetes]] and covers [[../k8s/pod|Pod]], [[../k8s/deployment|Deployment]], [[../k8s/service|Service]], [[../k8s/ingress|Ingress]], [[../k8s/configmap|ConfigMap]], [[../k8s/secret|Secret]], and [[../k8s/horizontal-pod-autoscaler|Horizontal Pod Autoscaler]].

It pairs well with [[infrastructure-as-code|infrastructure as code]] for reproducible clusters.
