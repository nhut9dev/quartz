---
title: Background jobs
description: Moving slow or deferred work off the request path so responses stay fast.
tags:
  - background-jobs
  - architecture
---

**Background jobs** run work outside the request/response cycle, so users do not wait on slow tasks like sending email, resizing images, or calling third-party APIs. Instead of blocking the response, the request enqueues work that a separate process picks up and runs later.

- [[job-queue|Job queue]] — enqueue work for async processing by workers
- [[worker-process|Worker process]] — the process that pulls and executes jobs
- [[scheduled-job|Scheduled job]] — running work on a schedule
- [[delayed-job|Delayed job]] — running work after a delay or at a future time
- [[bullmq|BullMQ]] — Redis-backed job queue for Node.js
