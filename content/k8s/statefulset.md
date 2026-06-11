---
title: StatefulSet
description: A Kubernetes controller for pods that need stable identity and persistent storage.
tags:
  - kubernetes
  - stateful
---

**StatefulSet** is a Kubernetes controller for [[pod|pods]] that need stable identity and persistent storage.

StatefulSets give pods predictable names, ordered rollout behavior, and stable volume claims. They fit databases, brokers, and clustered systems that care about identity.

Use a StatefulSet when each replica is not interchangeable. For stateless services, a [[deployment|Deployment]] is simpler.

The pitfall is assuming StatefulSet makes state easy. Backups, failover, data corruption, upgrades, and storage performance still need explicit operational design.
