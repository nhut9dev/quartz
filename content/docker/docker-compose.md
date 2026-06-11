---
title: Docker Compose
description: A tool for defining and running multiple Docker containers together.
tags:
  - docker
  - compose
---

**Docker Compose** is a tool for defining and running multiple [[docker-container|Docker containers]] together.

Compose uses a YAML file to describe services, ports, environment variables, [[docker-volume|volumes]], [[docker-network|networks]], and dependencies. It is common for local stacks that include an app, database, [[../redis/|Redis]], worker, and reverse proxy.

Use Compose for development, integration testing, demos, and simple single-host deployments. For multi-node scheduling, self-healing, and production orchestration, use [[../k8s/|Kubernetes]] or another orchestrator.

Do not treat `depends_on` as a readiness guarantee. A database container can be started but not ready, so apps still need retries and health checks.
