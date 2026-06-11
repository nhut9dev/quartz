---
title: Redis
description: An in-memory data store commonly used for caching, queues, and counters.
tags:
  - caching
  - database
---

**Redis** is an in-memory data store often used as a [[caching|cache]].

It supports strings, hashes, lists, sets, sorted sets, streams, expiration, and atomic operations, and is often used to back a [[message-queue|message queue]].

The fuller Redis map lives in [[../redis/|Redis]] and covers [[../redis/redis-data-structures|Redis data structures]], [[../redis/redis-cache|Redis cache]], [[../redis/redis-ttl|TTL]], [[../redis/redis-eviction|eviction]], [[../redis/redis-persistence|persistence]], [[../redis/redis-pubsub|Pub/Sub]], and [[../redis/redis-cluster|Redis Cluster]].

Redis is fast, but it is still an external system. Handle timeouts, failures, eviction, and data freshness explicitly.
