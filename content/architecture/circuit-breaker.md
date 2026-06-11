---
title: Circuit breaker
description: A reliability pattern that stops calling a failing dependency temporarily.
tags:
  - architecture
---

A **circuit breaker** prevents repeated calls to a dependency that is already failing.

After enough failures, the circuit opens and calls fail fast or use a fallback.

After a delay, it allows limited trial requests to see whether the dependency recovered.

This protects callers from slow cascades and gives failing services time to recover, which matters most in [[monolith-vs-microservices|microservices]] systems where one slow dependency can stall many callers.
