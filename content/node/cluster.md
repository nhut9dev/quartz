---
title: Cluster
description: A Node.js module for running multiple worker processes that share server load.
tags:
  - node
---

The **cluster** module lets a Node.js app run multiple worker processes.

This can use multiple CPU cores while each worker still runs its own JavaScript event loop.

Cluster can help CPU utilization for traditional Node servers, but modern deployment platforms often scale processes or containers directly.

For CPU-heavy work inside one app, also consider [[worker-threads|worker threads]].
