---
title: Linux logs
description: Logs produced by Linux services, the kernel, and system managers.
tags:
  - linux
  - observability
---

**Linux logs** record what the system and services are doing.

On systemd-based machines, `journalctl` is the main entry point. Many services also write files under `/var/log`. Containers often send logs to stdout and let the platform collect them.

Good debugging starts by narrowing time, service, host, and request identifiers. Logs are most useful when paired with [[../observability/correlation-id|correlation IDs]].
