---
title: Container registry
description: A service that stores and distributes container images.
tags:
  - docker
  - deployment
---

**Container registry** is a service that stores and distributes [[docker-image|container images]].

Registries such as Docker Hub, GHCR, ECR, GCR, and private registries let CI push images and deployment systems pull them by name and tag.

Use immutable tags or image digests for releases so a deployment can be traced and rolled back. Floating tags such as `latest` are convenient for development but risky for production.

Registries are part of the supply chain. Control permissions, scan images, pin base images, and clean up old artifacts.
