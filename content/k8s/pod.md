---
title: Pod
description: The smallest deployable unit in Kubernetes, containing one or more containers.
tags:
  - kubernetes
  - k8s
---

**Pod** is the smallest deployable unit in [[index|Kubernetes]], containing one or more containers that share network and storage context.

A pod usually runs one application container, sometimes with sidecars for logging, proxies, or helpers. Containers in the same pod share `localhost`, volumes, and lifecycle.

Pods are disposable. A controller such as a [[deployment|Deployment]] creates and replaces them to match desired state.

Do not treat pod names or IPs as stable. Use a [[service|Service]] for stable discovery.
