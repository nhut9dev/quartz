---
title: File ownership
description: The user and group ownership that control access to Linux files.
tags:
  - linux
  - security
---

**File ownership** decides which user and group own a file.

Ownership works together with [[file-permission|file permissions]]. A file can be readable by the owner, the group, everyone, or some combination depending on its mode bits.

Operational bugs often come from files created by the wrong user: logs cannot be written, builds cannot remove artifacts, or services cannot read secrets. Fix the ownership model instead of repeatedly changing permissions by hand.
