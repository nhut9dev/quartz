---
title: Scheduled job
description: Work that runs automatically on a recurring schedule rather than in response to a request.
tags:
  - background-jobs
  - scheduling
---

A **scheduled job** runs on a recurring schedule, defined by a cron expression or a fixed interval, instead of being triggered by user action.

## How it works

A scheduler evaluates each job's timing rule and enqueues or runs the work when it is due. Cron expressions describe calendar-style schedules (`0 3 * * *` for 3am daily); intervals describe simple periods like "every 5 minutes". The scheduler typically hands the actual work to a [[job-queue|job queue]] so a [[worker-process|worker]] runs it, rather than executing inside the timer itself.

```
*    *    *    *    *
min  hour day  mon  dow   →  0 3 * * *  = 03:00 every day
```

## When to use

Use scheduled jobs for periodic maintenance: nightly reports, cache warming, cleanup of expired rows, polling an external system, sending digest emails. Anything that should happen "on a clock" rather than "on an event".

## Pitfalls

In a distributed deployment every instance has the same schedule, so without coordination the job fires once per instance. Use [[../architecture/leader-election|leader election]] or a distributed lock so only one node runs each occurrence. Decide what happens to missed runs after downtime (skip, or catch up?) and prevent overlap when a run takes longer than its interval, otherwise slow runs pile up on top of each other.
