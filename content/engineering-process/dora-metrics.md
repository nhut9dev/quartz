---
title: DORA metrics
description: Four measures of software delivery performance speed and stability.
tags:
  - engineering-process
  - reliability
---

**DORA metrics** are four research-backed measures of software delivery performance: deployment frequency, lead time for changes, change failure rate, and time to restore service.

The first two capture speed, how often you ship and how long a change takes from commit to production. The last two capture stability, how often deploys cause failures and how fast you recover, often measured as MTTR.

The key finding is that speed and stability rise together: high performers deploy more often and recover faster, rather than trading one for the other.

These metrics describe outcomes of the whole delivery system, so they resist gaming better than counting individual output.

DORA metrics reward small batches like those favored by [[kanban|Kanban]], and improve as [[../sre/incident-response|incident response]] and [[../sre/postmortem|postmortems]] sharpen recovery.
