---
title: Docker Compose
description: A tool for running multiple containers together during development or simple deployments.
tags:
  - deployment
  - docker
---

**Docker Compose** defines multiple containers in one YAML file.

It is commonly used to run an app with its dependencies, such as a web server, database, cache, and worker.

```yaml
services:
  app:
    build: .
    ports:
      - "3000:3000"
  db:
    image: postgres:16
```

The fuller note lives in [[../docker/docker-compose|Docker Compose]] under the [[../docker/|Docker]] folder.

Compose is excellent for local development and small environments. Larger production systems often use platform-specific orchestration such as [[../k8s/|Kubernetes]] instead.
