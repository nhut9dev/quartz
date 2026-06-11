---
title: Redis Cluster
description: Redis sharding and replication mode for distributing keys across multiple nodes.
tags:
  - redis
  - scalability
---

**Redis Cluster** is Redis sharding and replication mode for distributing keys across multiple nodes.

Cluster splits the keyspace into hash slots and assigns slots to masters, with replicas available for failover. Clients need cluster awareness so they can follow redirects to the node that owns a key.

Use Redis Cluster when a single Redis instance cannot handle the memory or throughput required. It is a scale-out option, not a default requirement.

Cluster adds operational complexity: multi-key commands are restricted across slots, failover changes topology, and clients must handle moved slots correctly.
