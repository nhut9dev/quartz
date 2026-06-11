---
title: Connection pool tuning
description: Choosing how many DB or HTTP connections to pool so the system performs well under load.
tags:
  - concurrency
  - database
  - performance
---

**Connection pool tuning** is choosing the pool size so requests neither queue excessively nor overwhelm the downstream service. The pool itself is a [[../database/connection-pool|Connection pool]]; tuning is picking its bounds.

## How it works

A pool holds a fixed number of open connections that requests borrow and return. The size acts as a concurrency limit, much like a [[semaphore|Semaphore]]: when all connections are checked out, new requests wait in a queue up to a *queue timeout*, then fail.

## Pitfalls

**Too small** and requests spend their time queueing for a free connection — throughput stalls and tail latency spikes even though the database is idle. **Too big** and you flood the database past its own `max_connections`, where excess connections add contention and memory pressure, making *everything* slower. The right size is usually far smaller than people expect; a database serves a fixed number of queries in parallel, so more connections past that just queue inside the DB instead of in your app.

Pool exhaustion shows up as a burst of "timeout acquiring connection" errors, climbing latency, and a healthy-looking but underused database.

## Tradeoffs

Coordinate pool size with the upstream [[thread-pool|Thread pool]] and the database's connection limit across *all* app instances — N instances × pool size must stay under `max_connections`. Ultimately this is a [[../backend-performance/throughput-vs-latency|Throughput vs latency]] balance: bigger pools raise peak throughput until the DB saturates, after which they only add latency.
