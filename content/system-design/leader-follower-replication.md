---
title: Leader-follower replication
description: A replication model where one node accepts writes and followers copy its changes.
tags:
  - system-design
  - database
---

**Leader-follower replication** uses one leader for writes and one or more followers that copy the leader's changes.

The leader gives the system a clear write path. Followers can serve reads, provide redundancy, and support failover.

The tradeoffs include replication lag, failover complexity, and possible stale reads.

This model appears in many databases and is the usual foundation for [[read-replica|read replicas]].
