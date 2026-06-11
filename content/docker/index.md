---
title: Docker
description: Notes about building, running, networking, and shipping containerized applications with Docker.
tags:
  - docker
  - index
---

**Docker** is a platform for packaging applications and runtime dependencies into portable container images.

Docker sits between local development, [[../deployment/ci|CI]], and production deployment. These notes cover the practical pieces: [[dockerfile|Dockerfile]], [[docker-image|Docker image]], [[docker-container|Docker container]], [[docker-compose|Docker Compose]], networking, storage, and image publishing.

## Core Model

- [[docker-image|Docker image]]
- [[docker-container|Docker container]]
- [[dockerfile|Dockerfile]]
- [[docker-build-context|Docker build context]]
- [[multi-stage-build|Multi-stage build]]

## Runtime

- [[docker-compose|Docker Compose]]
- [[docker-volume|Docker volume]]
- [[docker-network|Docker network]]
- [[container-registry|Container registry]]
- [[../sre/container-image-layering|Container image layering]]
