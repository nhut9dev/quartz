---
title: Job and CronJob
description: Kubernetes controllers for one-off and scheduled work.
tags:
  - kubernetes
  - batch
---

**Job and CronJob** are Kubernetes controllers for one-off and scheduled work.

A Job runs pods until a task completes successfully. A CronJob creates Jobs on a schedule, similar to [[../linux/cron|cron]], but inside the cluster.

Use Jobs for migrations, batch processing, backfills, and maintenance tasks. Use CronJobs for periodic cleanup, reports, syncs, and scheduled checks.

Be explicit about retries, deadlines, concurrency policy, and idempotency. A retried Job can run the same work more than once.
