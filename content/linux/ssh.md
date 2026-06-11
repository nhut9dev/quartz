---
title: SSH
description: A secure protocol for connecting to remote machines and forwarding data.
tags:
  - linux
  - security
  - networking
---

**SSH** is used to log into remote machines, run commands, copy files, and create secure tunnels.

Key-based authentication is safer and more automatable than password login. Production access should use least privilege, short-lived credentials where possible, and audit logs.

Common failure points include wrong usernames, missing keys, file permissions on private keys, blocked ports, and host key changes.
