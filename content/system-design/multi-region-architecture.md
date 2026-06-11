---
title: Multi-region architecture
description: Running an application across multiple geographic regions for latency, resilience, or compliance.
tags:
  - system-design
  - reliability
---

A **multi-region architecture** serves users from more than one geographic region.

It can lower latency and survive regional outages, but it adds hard decisions around data replication, routing, failover, consistency, and deployment coordination.

Active-passive is simpler: one region serves primary traffic and another waits. Active-active can improve latency and resilience, but conflict handling and [[consistency-model|consistency models]] become central design concerns.
