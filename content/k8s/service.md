---
title: Service
description: A stable Kubernetes network endpoint for reaching a set of pods.
tags:
  - kubernetes
  - networking
---

**Service** is a stable Kubernetes network endpoint for reaching a set of [[pod|pods]].

Pods are replaced often and get new IPs. A Service selects pods by labels and gives clients a stable DNS name and virtual IP.

Common types are `ClusterIP` for internal traffic, `NodePort` for exposing a port on each node, and `LoadBalancer` for cloud load balancers. HTTP routing from outside the cluster usually uses [[ingress|Ingress]] in front of Services.

The pitfall is mismatched labels or target ports. The Service can exist and still route to no healthy pods.
