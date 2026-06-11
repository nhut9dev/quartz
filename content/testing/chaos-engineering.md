---
title: Chaos engineering
description: Injecting failures into a system to verify its resilience.
tags:
  - testing
  - sre
  - resilience
---

**Chaos engineering** deliberately injects failures, such as added latency, killed instances, or network partitions, into a production-like system to verify it stays healthy under stress.

## How it works

You start from a hypothesis: define a measurable **steady state** (for example, request success rate), predict that it holds during a failure, then inject that failure and watch.

Critically, you bound the **blast radius**, limiting the experiment to a small slice of traffic or one zone so a wrong hypothesis does not take down the whole system.

Teams often run these as scheduled **game days**, where engineers rehearse incidents together and tighten runbooks.

## When to use

Use it once a system has redundancy worth testing, to confirm that a [[../architecture/circuit-breaker|circuit breaker]] trips, a [[../architecture/bulkhead|bulkhead]] isolates a failing pool, and [[../sre/disaster-recovery|disaster recovery]] actually works before a real outage forces the question.

## Pitfalls

Running it without monitoring or a fast abort means you cause incidents instead of learning from them.

Start in staging, keep the blast radius small, and only move to production once the failure modes are well understood.
