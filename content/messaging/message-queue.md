---
title: Message queue
description: A system that stores messages until consumers process them.
tags:
  - messaging
---

A **message queue** lets producers send work that consumers process later, holding each message durably in between.

Queues help absorb spikes, decouple services, and move slow work out of request paths, which makes them a building block for [[event-driven|event-driven]] systems.

## How it works

A producer appends a message and returns immediately — it does not wait for the work to finish. The broker persists the message (to disk or a replicated log) so it survives a crash. A consumer pulls the next message, does the work, then *acknowledges* it; only on the ack does the broker mark it done and stop redelivering.

That ack is the heart of the mechanism. If a consumer dies after pulling but before acking, a visibility timeout expires and the message becomes available again for another consumer. This is what makes the queue reliable, and also why redelivery — and therefore duplicates — is normal rather than exceptional.

## When to use

Reach for a queue when the producer shouldn't block on the work: sending email, generating a report, transcoding video, fanning out notifications. It also fits bursty traffic with a fixed worker pool — the queue is a buffer that flattens a spike into a steady drain rate instead of overwhelming downstream. And it decouples deploys: producer and consumer scale and fail independently.

It is the wrong tool when the caller needs the result before responding (use a synchronous call), or when end-to-end latency must be single-digit milliseconds — the extra hop and the pull interval add delay.

## Trade-offs

You trade immediate consistency for resilience and throughput. The producer no longer knows whether the work succeeded, so success and failure have to be observed out-of-band (status fields, events, dead-letter inspection). You also take on a broker to operate and the obligation to make consumers tolerate duplicates and reordering.

## Pitfalls

The biggest is assuming once-and-in-order delivery. Most queues give [[at-least-once-delivery|at-least-once]] delivery, so consumers must be idempotent through [[idempotency|idempotency]] or [[message-deduplication|deduplication]]. A poison message that always fails will be redelivered forever and can block a partition or starve a worker — route it to a [[dead-letter-queue|dead-letter queue]] after N attempts. And an unbounded queue hides a capacity problem: if producers consistently outpace consumers, the backlog grows without limit and latency quietly climbs until something falls over.
