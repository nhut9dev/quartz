---
title: Timeout
description: Bounding how long a call may wait so a slow dependency cannot hang the caller.
tags:
  - architecture
  - reliability
  - resilience
---

A **timeout** caps how long a network call may block before the caller gives up and reclaims its resources.

The default for most clients is to wait indefinitely, which is the single most common cause of cascading hangs. A call with no deadline holds a thread, a connection, and a request slot for as long as the dependency stays slow. As slow calls pile up, the pool exhausts, and a caller that was merely *talking* to a degraded service becomes degraded itself.

## How it works

A single number rarely captures intent, so split the budget. The *connect* timeout bounds establishing the TCP/TLS connection and should be short, since a healthy peer connects in milliseconds. The *read* timeout bounds waiting for bytes after the request is sent. The *total* (or deadline) timeout bounds the whole operation including retries, and is what the caller actually cares about.

In a call chain, set deadlines once at the edge and propagate them. Each hop computes its remaining budget from the deadline it received, so a request that has already burned 400ms of a 500ms budget never lets a downstream service wait the full 500ms again.

```js
// each hop shrinks the budget it passes on
const remaining = deadline - Date.now();
if (remaining <= 0) throw new DeadlineExceeded();
await call(downstream, { timeoutMs: remaining });
```

## Pitfalls

Timeouts must be derived from real latency, not guessed. Set them above the dependency's high [[../backend-performance/latency-percentiles|Latency percentiles]] (p99), or you will abort calls that were about to succeed and turn a slow service into a failing one. Too long, and the timeout does nothing.

## Tradeoffs

Timeouts are the foundation other patterns build on: a [[circuit-breaker|Circuit breaker]] needs a bounded failure to count, a [[retry|Retry]] needs a bounded attempt to repeat, and a [[bulkhead|Bulkhead]] only contains damage if slow calls actually release their slot. Every network call should have one; the question is only what the budget should be.
