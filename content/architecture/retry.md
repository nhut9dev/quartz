---
title: Retry
description: Re-issuing a failed request to ride out transient failures without amplifying load.
tags:
  - architecture
  - reliability
  - resilience
---

A **retry** re-issues a request that failed for a transient reason, on the bet that the same call will succeed a moment later.

Retries only help against *transient* faults: timeouts, connection resets, `503`, throttling. Retrying a `400`, a validation error, or a `404` just wastes capacity and delays the inevitable failure. Inspect the error first and retry only what is retryable.

## How it works

Naive retries with a fixed delay are dangerous. When a dependency hiccups, every caller fails at the same instant and retries on the same schedule, so the recovering service is hit by a synchronized wall of traffic, a *retry storm* or thundering herd, and falls over again. The fix is exponential backoff with jitter: each attempt waits longer, and a random component spreads the retries out over time.

```js
async function withRetry(fn, max = 3) {
  for (let i = 0; ; i++) {
    try { return await fn(); }
    catch (e) {
      if (!isRetryable(e) || i >= max) throw e;
      const base = 2 ** i * 100;          // exponential
      await sleep(Math.random() * base);  // full jitter
    }
  }
}
```

## Pitfalls

A retry must target an idempotent operation, or it can double-charge a card or duplicate an order. Make the target safe to repeat, often via an [[../api-design/idempotency-key|Idempotency key]] so the server dedupes replays.

Retries also stack: a chain of three services each retrying three times means up to 27 calls hit the leaf. Cap total amplification with a *retry budget*, allowing retries only while their share of traffic stays under a few percent, and gate them behind a [[circuit-breaker|Circuit breaker]] so an open circuit suppresses retries entirely.

## Tradeoffs

Retries trade latency and load for success rate. Pair them with a [[timeout|Timeout]] so a slow call is abandoned and retried rather than hanging, and bound the attempts so the caller fails predictably. When a message exhausts its retries, route it to a [[../messaging/dead-letter-queue|Dead-letter queue]] for inspection instead of looping forever.
