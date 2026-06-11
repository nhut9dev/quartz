---
title: Replication
description: Copying database data from one node to another for availability, reads, or recovery.
tags:
  - database
---

**Replication** copies data from one database node to another.

It can improve read capacity, disaster recovery, and availability.

Replication is often asynchronous, which means replicas may lag behind the primary.

Design reads carefully when stale data would break user expectations or business rules.
