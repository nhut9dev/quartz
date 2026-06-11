---
title: Docker image
description: An immutable filesystem template used to create containers.
tags:
  - docker
  - container
---

**Docker image** is an immutable filesystem template used to create [[docker-container|containers]].

An image contains application code, runtime files, system packages, and metadata such as the default command. Images are built from a [[dockerfile|Dockerfile]] and are usually pushed to a [[container-registry|container registry]].

Images are layered. Stable layers should come before frequently changing layers so builds and pulls can reuse cached work. See [[../sre/container-image-layering|container image layering]].

Treat images as deployable artifacts. Tag them with immutable versions in CI instead of relying only on `latest`.
