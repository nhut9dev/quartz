---
title: Disaster recovery
description: Planning how a system returns to service after a major outage or data-loss event.
tags:
  - sre
  - reliability
---

**Disaster recovery** is the plan for restoring service after severe failure.

Two numbers shape the design: RTO is how long recovery may take; RPO is how much data loss is acceptable. Lower numbers require more investment in replication, backups, automation, and rehearsals.

A plan that is never tested is mostly a document. Recovery drills should verify people, access, infrastructure, data, and communication paths.
