---
title: Deployment
description: A Kubernetes controller that keeps a desired number of stateless pod replicas running.
tags:
  - kubernetes
  - k8s
---

**Deployment** is a Kubernetes controller that keeps a desired number of stateless [[pod|pod]] replicas running.

### How it works

A Deployment creates ReplicaSets, and ReplicaSets create Pods. You describe the desired image, replica count, labels, rollout strategy, and pod template; Kubernetes continuously reconciles actual state toward that desired state.

Deployments support rolling updates and rollbacks. When the pod template changes, Kubernetes gradually replaces old pods with new ones while respecting availability settings.

### When to use

Use Deployments for stateless web services, APIs, workers, and apps where any replica can handle the same work.

### Trade-offs

Deployments make rollouts and self-healing straightforward, but they are not enough for stable identity or per-replica storage. For that, use [[statefulset|StatefulSet]].

### Pitfalls

Missing resource requests, weak [[readiness-and-liveness-probe|readiness probes]], and unsafe rollout settings can cause downtime even when the YAML looks valid.
