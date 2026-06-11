---
title: Fallback
description: Serving a degraded but useful response when a dependency fails instead of erroring out.
tags:
  - architecture
  - reliability
  - resilience
---

A **fallback** lets a service return a degraded-but-useful answer when a dependency is unavailable, rather than propagating the failure to the user.

The idea is graceful degradation: a recommendation widget that shows generic bestsellers, a profile page that hides the live "online" badge, a checkout that defers fraud scoring instead of blocking. The core path still works; only the part that depends on the broken thing is reduced.

## How it works

Fallbacks come in two flavors. A *static fallback* returns a fixed default, an empty list, a feature turned off, a hardcoded value, which always works but carries no real data. A *cached fallback* serves the last known good value from a local or shared cache, which is far more useful but can be stale, so it pairs naturally with [[../caching/stale-while-revalidate|Stale-while-revalidate]] to keep serving while the source recovers in the background.

Fallbacks usually sit behind a [[circuit-breaker|Circuit breaker]]: when the circuit opens, calls divert to the fallback instead of hammering the dead dependency.

## When to use

Fallback fits non-critical, read-heavy features where an approximate or slightly stale answer beats an error page. It is also how a multi-instance system behind [[load-balancing|Load balancing]] keeps serving while individual backends drop out.

## Pitfalls

Failing fast is sometimes the right answer. A bank balance, an inventory count, or an authorization decision must not silently fall back to stale or default data, since a wrong answer is worse than no answer. A fallback that hides a persistent outage is also a hazard: degraded mode should be visible in metrics and alerts, never a quiet permanent state nobody notices.
