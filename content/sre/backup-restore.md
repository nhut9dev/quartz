---
title: Backup and restore
description: Copying data for recovery and regularly proving that the copy can be restored.
tags:
  - sre
  - database
  - reliability
---

**Backup and restore** protects data from deletion, corruption, outages, and operator mistakes.

Backups are not complete until restore has been tested. Teams should know where backups live, how long they are retained, who can access them, and how quickly they can restore a usable system.

Important details include encryption, offsite copies, point-in-time recovery, restore drills, and monitoring that confirms backups are still being created.
