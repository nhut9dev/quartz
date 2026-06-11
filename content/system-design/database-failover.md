---
title: Database failover
description: Moving database traffic to a healthy node when the primary database is unavailable.
tags:
  - system-design
  - database
  - reliability
---

**Database failover** promotes or routes traffic to another database node when the current primary cannot serve traffic.

Automatic failover reduces downtime, but it can create split-brain risk, lost writes, or confusing recovery if replication lag is high. Manual failover is slower but gives operators more control.

A production design should define the health signal, promotion rules, client reconnection behavior, backup plan, and how the team verifies data after recovery. See also [[../database/replication|Replication]] and [[../sre/disaster-recovery|Disaster recovery]].
