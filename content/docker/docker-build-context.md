---
title: Docker build context
description: The set of files sent to the Docker builder during image creation.
tags:
  - docker
  - build
---

**Docker build context** is the set of files sent to the Docker builder during image creation.

The `COPY` and `ADD` instructions can only read files from the build context. A large context slows builds and can accidentally include secrets, dependencies, local caches, or generated artifacts.

Use `.dockerignore` the way you use [[../git/gitignore|.gitignore]]: exclude `node_modules`, build output, logs, local env files, coverage, and anything the image should not contain.

Bad build contexts make [[dockerfile|Dockerfile]] caching less predictable and image builds harder to reason about.
