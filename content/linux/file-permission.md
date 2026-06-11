---
title: File permission
description: Read, write, and execute bits for user, group, and other, controlling access to a file.
tags:
  - linux
---

A **file permission** controls who may read, write, or execute a file. Each file carries three bits, repeated for three audiences.

The audiences are the owning **user**, the owning **group**, and everyone **else** (other). The bits are read (`r`), write (`w`), and execute (`x`).

You see them as `rwxr-xr--` and change them with `chmod`, either symbolically (`chmod u+x`) or numerically (`chmod 755`), where each digit packs the three bits.

Execute permission matters for running scripts and entering directories, not just reading them.

Permissions are the first line of access control, deciding what each [[process|process]] can touch based on its user.
