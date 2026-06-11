---
title: Container image layering
description: How container images are built from reusable filesystem layers.
tags:
  - sre
  - deployment
  - docker
---

**Container image layering** is how container images are built from reusable filesystem changes.

Each Dockerfile instruction can create a layer. Stable layers should come before frequently changing layers so builds and pulls can reuse cached work.

Good layering reduces image size, build time, deploy time, and security scan noise.

It is a practical detail behind [[../deployment/docker|Docker]], CI pipelines, and production rollout speed.
