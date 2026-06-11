---
title: Docker container
description: A running process started from a Docker image with isolated filesystem, network, and process space.
tags:
  - docker
  - container
---

**Docker container** is a running process started from a [[docker-image|Docker image]] with isolated filesystem, network, and process space.

Containers are not full virtual machines. They share the host kernel but run with separate namespaces and resource controls, which makes them lightweight and fast to start.

Containers should be disposable. Persist data in a [[docker-volume|Docker volume]] or external service, pass configuration through environment variables or secrets, and expect orchestration platforms such as [[../k8s/|Kubernetes]] to stop and replace them.

The common mistake is debugging a container as if it were a pet server. If a fix matters, put it in the image, config, or deployment definition.
