---
title: systemd
description: The common Linux init and service manager used to start and supervise services.
tags:
  - linux
  - operations
---

**systemd** starts services, tracks their state, and manages dependencies between units.

Service units describe how a process starts, stops, restarts, and logs output. Operators commonly use `systemctl status`, `systemctl restart`, and `journalctl` when debugging.

For application teams, the important pieces are restart policy, environment configuration, logs, and readiness behavior. See also [[linux-logs|Linux logs]] and [[process|Process]].
