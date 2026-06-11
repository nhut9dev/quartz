---
title: Ingress
description: Kubernetes HTTP routing from outside the cluster to internal services.
tags:
  - kubernetes
  - networking
---

**Ingress** is Kubernetes HTTP routing from outside the cluster to internal [[service|Services]].

Ingress rules map hosts and paths to Services. An ingress controller implements those rules using a proxy or load balancer such as NGINX, Traefik, HAProxy, or a cloud provider controller.

Use Ingress for public HTTP and HTTPS entry points, shared domains, TLS termination, and path-based routing.

Ingress is only a declaration. Without a working ingress controller, DNS, certificates, and correct Service targets, the resource does nothing useful.
