---
title: Delayed job
description: A job enqueued now but scheduled to run after a delay or at a specific future time.
tags:
  - background-jobs
  - scheduling
---

A **delayed job** is enqueued immediately but does not become runnable until a delay elapses or a target timestamp is reached.

## How it works

The job carries a "not before" time. The queue keeps it out of the ready set until then, and only after the delay does a [[worker-process|worker]] pick it up. Two common implementations: a sorted set keyed by ready-at timestamp that a poller scans for due entries, or a broker-level visibility timeout that hides the message until the deadline. It is a scheduling variant of an ordinary [[job-queue|job queue]] entry.

## When to use

Use delayed jobs for retry backoff (re-attempt a failed call in 30s, then 2m, then 10m), reminders ("email the user if they haven't verified in 24h"), debounced side effects (collapse a burst of edits into one notification), and trial-expiry or grace-period actions.

## Pitfalls

A delay is a floor, not a guarantee: the job runs at or after the target time, never before, but a backlog can push it later. The state of the world may have changed by the time it runs, so re-check preconditions instead of trusting the payload. For repeating backoff, pair delayed jobs with a bounded [[../architecture/retry|retry]] policy so failures eventually give up rather than looping forever.
