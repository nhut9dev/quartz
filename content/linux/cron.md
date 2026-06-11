---
title: cron
description: A Linux scheduler for running commands at fixed times.
tags:
  - linux
  - automation
---

**cron** runs commands on a schedule.

It is useful for simple recurring jobs such as cleanup tasks, reports, backups, and periodic syncs. Each job should be idempotent, log clearly, and handle failure without silently corrupting state.

For critical workflows, prefer a scheduler with retries, visibility, locking, and alerting. Cron is simple, but it is easy to forget that scheduled jobs are production code.
