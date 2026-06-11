---
title: Kubernetes ingress
description: Kubernetes routing from external HTTP traffic to services inside a cluster.
tags:
  - sre
  - kubernetes
  - networking
---

**Kubernetes ingress** routes external HTTP traffic to services inside a Kubernetes cluster.

An ingress usually defines hosts, paths, TLS settings, and the backend service that should receive matching traffic.

The ingress resource is implemented by an ingress controller such as NGINX, Traefik, or a cloud provider controller.

Ingress sits near [[../architecture/load-balancing|load balancing]], [[../networking/tls-handshake|TLS]], and service routing concerns.
