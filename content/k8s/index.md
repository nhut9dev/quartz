---
title: Kubernetes
description: Notes about running containerized workloads on Kubernetes clusters.
tags:
  - kubernetes
  - k8s
  - index
---

**Kubernetes** is a container orchestrator that runs and manages workloads across a cluster of machines.

Kubernetes is useful when you need scheduling, self-healing, service discovery, rollout control, and scaling for many [[../docker/docker-container|containers]]. It is also complex enough that small apps may be better served by simpler deployment platforms.

## Workloads

- [[pod|Pod]]
- [[deployment|Deployment]]
- [[statefulset|StatefulSet]]
- [[job-and-cronjob|Job and CronJob]]

## Networking

- [[service|Service]]
- [[ingress|Ingress]]
- [[namespace|Namespace]]

## Configuration and Operations

- [[configmap|ConfigMap]]
- [[secret|Secret]]
- [[readiness-and-liveness-probe|Readiness and liveness probe]]
- [[horizontal-pod-autoscaler|Horizontal Pod Autoscaler]]
