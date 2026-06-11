---
title: BullMQ
description: A Redis-backed job queue library for Node.js with retries, scheduling, and flows.
tags:
  - background-jobs
  - node
---

**BullMQ** is a Redis-backed [[job-queue|job queue]] library for Node.js. A `Queue` adds jobs; a `Worker` consumes them; both share state in [[../caching/redis|Redis]], so producers and workers can live in different processes or machines.

## How it works

You create a queue by name and add jobs with a payload and options. Workers attach a handler to that queue name and process jobs concurrently, with concurrency configurable per worker.

```js
const queue = new Queue("email");
await queue.add("welcome", { userId: 42 }, { delay: 5000, attempts: 3 });

new Worker("email", async (job) => {
  await sendEmail(job.data.userId);
}, { concurrency: 10 });
```

## Features

- **Repeatable jobs** for cron-style [[scheduled-job|scheduled work]], and a `delay` option for [[delayed-job|delayed jobs]].
- **Retries with backoff** via `attempts` and a `backoff` strategy (fixed or exponential).
- **Failed set**: jobs that exhaust their attempts land in a failed state you can inspect, retry, or drain — BullMQ's take on a [[../messaging/dead-letter-queue|dead-letter queue]].
- **Flows**: parent/child job trees where a parent runs only after its children complete, for fan-out/fan-in pipelines.

## Pitfalls

Everything rides on Redis: its availability and persistence settings determine whether jobs survive a crash. Handlers should be idempotent because a job can run again after a worker dies mid-execution. Watch memory as completed and failed jobs accumulate — configure `removeOnComplete` and `removeOnFail` so the queue does not grow without bound.
