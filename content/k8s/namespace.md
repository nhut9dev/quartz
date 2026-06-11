---
title: Namespace
description: A Kubernetes scope for grouping and isolating related resources inside a cluster.
tags:
  - kubernetes
  - k8s
---

**Namespace** is a Kubernetes scope for grouping and isolating related resources inside a cluster.

Namespaces help separate environments, teams, apps, or system components. Namespaced resources include [[pod|Pods]], [[service|Services]], [[configmap|ConfigMaps]], and [[secret|Secrets]].

Use namespaces with RBAC, resource quotas, and naming conventions when a cluster hosts more than one app or team.

Namespaces are not a hard security boundary by themselves. Network policy, permissions, and cluster configuration decide the real isolation level.
