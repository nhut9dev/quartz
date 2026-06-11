---
title: Package manager
description: The system tool used to install, update, and remove Linux software packages.
tags:
  - linux
  - tooling
---

A Linux **package manager** installs software and tracks dependencies.

Examples include `apt`, `dnf`, `yum`, `pacman`, and `apk`. Package managers differ, but the workflow is similar: update metadata, install packages, upgrade versions, and remove unused software.

For servers, package changes should be repeatable. Prefer scripted provisioning or images over manual installs that cannot be reproduced.
