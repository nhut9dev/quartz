---
title: Connection pool
description: A reusable set of database connections shared by an application.
tags:
  - database
  - backend
---

A **connection pool** keeps a set of open database connections that requests borrow and return, instead of opening a fresh connection per request.

## How it works

Opening a database connection is expensive — a TCP handshake, TLS, authentication, and backend process/thread setup, often tens of milliseconds. A pool pays that cost once per connection at startup and then *reuses* them: a request checks out an idle connection, runs its queries, and returns it to the pool for the next request. If all connections are busy, a request either waits for one to free up or fails after a timeout. The pool also caps the **total** connections the app opens, which protects the database from being swamped.

## Sizing

Pool size is the key tuning knob, and bigger is not better. Too small, and requests queue waiting for a free connection even though the database is idle. Too large, and many connections contend inside the database — each consumes memory and a backend worker, so past the point where the database can run queries concurrently (roughly bounded by CPU cores and disk), more connections add contention, not throughput. The counterintuitive result: a *smaller* pool often yields higher throughput and lower latency than a large one.

## Pitfalls

The hardest problem at scale is **multiplying pools**: 50 app instances each with a pool of 20 means 1,000 connections at the database, which can exceed its `max_connections` and exhaust it — so pool size must be reasoned about across the whole fleet, sometimes via an external pooler like PgBouncer. **Connection leaks** (a borrowed connection never returned, usually a missing release on an error path) silently shrink the usable pool until everything blocks. And a connection held open across a slow external call ties up a pooled resource for no database work — keep checkout windows as short as the query itself.
