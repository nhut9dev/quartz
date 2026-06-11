---
title: Change data capture
description: Streaming row-level changes out of a database by reading its transaction log.
tags:
  - database
  - messaging
---

**Change data capture** (CDC) turns every insert, update, and delete in a database into an event stream that other systems can consume, without the application having to publish those events itself.

## How it works

The most reliable form is **log-based CDC**: a connector (Debezium is the common one) tails the database's write-ahead log — Postgres logical replication slots, MySQL binlog — and emits one ordered event per committed row change. Because it reads the same log the database uses for [[replication|replication]] and crash recovery, it captures changes in commit order and misses nothing, even bulk updates that never touched application code.

The events flow into a log like [[kafka|Kafka]], where downstream consumers project them: keeping a [[search-indexing|search index]] in sync, invalidating a [[cache-invalidation|cache]], feeding a data warehouse, or fanning out to other services.

## Why it beats dual writes

Writing to the database and then publishing an event is two operations that can partially fail, leaving systems inconsistent. CDC derives the event *from* the commit, so the change and its notification share a single source of truth — the same guarantee the [[outbox-pattern|outbox pattern]] gives, but without the application maintaining an outbox table.

## Pitfalls

Consumers see [[eventual-consistency|eventual consistency]]: the downstream view lags the database by the stream's latency. Events are usually **at-least-once**, so consumers must be idempotent. Schema changes (a dropped column, a type change) can break decoding, so the pipeline needs a schema-evolution strategy. And log-based CDC ties you to database-specific internals — replication slots that, if a consumer stalls, hold WAL segments and can fill the disk.
