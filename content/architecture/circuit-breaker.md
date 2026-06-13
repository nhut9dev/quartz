---
title: Circuit breaker
description: A reliability pattern that stops calling a failing dependency temporarily.
tags:
  - architecture
---

A **circuit breaker** stops a caller from repeatedly hitting a dependency that's already failing, failing fast instead — which protects the caller from slow cascades and gives the failing service room to recover.

It matters most in [[monolith-vs-microservices|microservices]], where one slow dependency can stall every caller that touches it.

## The three states

The breaker is a state machine wrapping calls to a dependency:

- **Closed** — calls pass through normally while the breaker counts failures. Crossing a threshold (e.g. 50% errors over a window) trips it open.
- **Open** — calls fail immediately without touching the dependency, returning an error or [[fallback|fallback]] right away. No request waits on a [[timeout|timeout]]; the dependency gets no traffic.
- **Half-open** — after a cool-down, the breaker lets a few trial requests through. If they succeed, it closes; if they fail, it re-opens and waits again.

The point of failing fast in the open state is twofold: the caller doesn't tie up threads waiting on a dead dependency (the exhaustion a [[bulkhead|bulkhead]] also guards against), and the dependency gets a break from traffic instead of being hammered while it's trying to recover.

## When to use

Wrap calls to dependencies that can fail or slow independently — remote services, third-party APIs, databases under load. It's most useful where a slow dependency would otherwise hold connections/threads open long enough to exhaust the caller and cascade the outage outward.

## Pitfalls

Thresholds are hard to tune: too sensitive and the breaker trips on normal transient blips, cutting off a healthy dependency; too lax and it opens long after the damage is done. The open state needs a sensible [[fallback|fallback]] — cached data, a default, a queued retry — or you've just converted slow failures into fast ones without improving the user's outcome. And a single trial request in half-open can misjudge recovery, while a flood of them can re-overwhelm a service that's only just come back.
