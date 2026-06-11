---
title: Multi-stage build
description: A Dockerfile pattern that separates build-time dependencies from the final runtime image.
tags:
  - docker
  - build
---

**Multi-stage build** is a [[dockerfile|Dockerfile]] pattern that separates build-time dependencies from the final runtime image.

One stage compiles, bundles, or tests the app. A later stage copies only the runtime output into a smaller base image. This keeps compilers, package caches, source maps, and development tools out of production images.

Use it for compiled languages, frontend builds, TypeScript services, and any app where build dependencies are larger or riskier than runtime dependencies.

The pitfall is copying too much from the build stage. Copy the minimal artifact needed to run, then verify the final [[docker-image|image]] still has the files and permissions the app expects.
