---
title: Docker volume
description: Persistent storage managed by Docker and mounted into containers.
tags:
  - docker
  - storage
---

**Docker volume** is persistent storage managed by Docker and mounted into containers.

Containers are disposable, so data that must survive restarts belongs in a volume or an external service. Volumes are commonly used for databases, uploaded files in local development, and caches that should persist between runs.

Bind mounts point at a host path and are convenient for local code editing. Named volumes are managed by Docker and are less tied to a specific filesystem path.

Be careful with ownership, backup, and cleanup. Removing a container does not necessarily remove its volume, and removing the wrong volume can delete real data.
