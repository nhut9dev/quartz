---
title: Dockerfile
description: A build recipe that turns source code and dependencies into a Docker image.
tags:
  - docker
  - build
---

**Dockerfile** is a build recipe that turns source code and dependencies into a [[docker-image|Docker image]].

### How it works

Each instruction describes a filesystem or metadata change: choose a base image, copy files, install dependencies, set environment variables, expose ports, and define the default command. Build caching depends heavily on instruction order and the [[docker-build-context|build context]].

For application images, copy dependency manifests before source files so dependency installation can stay cached. Use [[multi-stage-build|multi-stage builds]] to keep compilers and build tools out of the final runtime image.

### When to use

Use a Dockerfile when an app needs repeatable development, CI, or deployment packaging. It is especially useful when system dependencies, runtime versions, or build steps need to be consistent across machines.

### Trade-offs

Dockerfiles make environments reproducible, but they add another artifact to maintain. Base image choice affects security, size, compatibility, and debugging convenience.

### Pitfalls

Avoid copying secrets into images, installing unnecessary packages, running as root by default, using floating base tags without control, and invalidating cache by copying the whole project before dependency installation.
