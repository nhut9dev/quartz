---
title: CAP theorem
description: A distributed systems idea about consistency, availability, and partition tolerance.
tags:
  - architecture
---

**CAP theorem** says that during a network partition, a distributed system must choose between consistency and availability.

Consistency means every read sees the latest valid write. Availability means every request receives a non-error response.

Partition tolerance is not optional in real networks.

CAP is a simplification, but it helps explain why distributed data systems expose tradeoffs such as [[eventual-consistency|eventual consistency]].
