---
title: Job queue
description: A queue of work items enqueued by requests and processed asynchronously by workers.
tags:
  - background-jobs
  - architecture
---

A **job queue** holds units of work that a request enqueues and a [[worker-process|worker process]] executes later, decoupling when work is requested from when it runs.

## How it works

A producer pushes a job (a name plus a payload) onto the queue and returns immediately. One or more workers poll or subscribe to the queue, pull the next job, run a handler, and acknowledge success or failure. The queue is usually backed by Redis, a database table, or a message broker. This is a job-focused layer built on top of a plain [[../messaging/message-queue|message queue]]: it adds retries, scheduling, and progress tracking that raw queues leave to you.

## When to use

Reach for a job queue when work is slow, can fail and retry, or does not need to finish before the response: sending email, generating reports, processing uploads, fanning out webhooks. The synchronous alternative does the work inline, which keeps things simple but couples response latency to the slowest dependency and loses work if the process dies mid-request.

## Pitfalls

Jobs run at least once on most queues, so handlers must be idempotent or guard against duplicate effects. Plan for failure: bounded retries, a dead-letter destination, and visibility into stuck or backed-up jobs. A queue that grows faster than workers drain it just hides latency rather than removing it.

A Redis-backed option for Node is [[bullmq|BullMQ]].
