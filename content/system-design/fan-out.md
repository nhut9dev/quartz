---
title: Fan-out
description: Sending one event or request to many downstream recipients.
tags:
  - system-design
  - messaging
---

**Fan-out** is the delivery of one event, message, or write to many downstream recipients — the shape behind feeds, notifications, chat, [[../design-patterns/pub-sub|pub/sub]], and cache invalidation.

## Fan-out on write vs on read

The central design choice is *when* the fan-out work happens:

- **Fan-out on write** — when something is produced, immediately push it to every recipient's precomputed store. A post is written into all the followers' feed caches at post time. Reads are then trivial (just read your own feed), but writes are expensive and amplified — one post can mean thousands of writes.
- **Fan-out on read** — store the item once and assemble each recipient's view *when they ask*. A feed is computed by pulling from everyone you follow at read time. Writes are cheap, but reads are expensive and slower.

It's a classic precompute-vs-compute-on-demand trade, decided by the read/write ratio, latency target, and storage budget.

## Choosing

Push (on write) wins when reads vastly outnumber writes and read latency must be low — most consumer feeds, where people scroll far more than they post. Pull (on read) wins when writes are frequent or recipients are many per item, so precomputing would amplify writes wastefully. Many real systems do **both**: precompute for ordinary accounts, switch to on-read for accounts with huge audiences.

## Pitfalls

The signature failure is the **celebrity / [[../caching/hot-key|hot-key]] problem**: fan-out on write for an account with 50 million followers means one post triggers 50 million writes — a thundering spike that can stall the system. That's why high-follower accounts are special-cased to fan-out on read. Pure on-read, conversely, makes every feed load do heavy fan-in work and struggles under read load. Fan-out is typically implemented over [[../messaging/message-queue|message queues]] or stream processing, which means delivery is [[../messaging/at-least-once-delivery|at-least-once]] — recipients can get duplicates and need dedup.
