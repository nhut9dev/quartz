---
title: Read replica
description: A database copy used to scale read traffic away from the primary.
tags:
  - system-design
  - database
---

A **read replica** is a database copy used to serve read traffic while the primary handles writes.

Replicas improve read scalability and isolate analytical or expensive reads from the primary database.

The main tradeoff is replication lag. A user may write data to the primary and then read stale data from a replica shortly after.

Read replicas are closely related to [[leader-follower-replication|leader-follower replication]] and [[../database/replication|database replication]].
