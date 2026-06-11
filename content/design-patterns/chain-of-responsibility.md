---
title: Chain of responsibility
description: Passing a request along a chain of handlers until one handles it.
tags:
  - design-patterns
---

The **chain of responsibility** pattern passes a request along an ordered list of handlers, each deciding whether to process it or forward it to the next.

The sender does not know which handler will respond, and handlers can be added, removed, or reordered without changing the caller.

Use it for pipelines like validation, authentication, and logging, where each step may handle, transform, or pass the request along.

The tradeoff is that a request may fall off the end of the chain unhandled if no handler matches.

[[../express/middleware|Express middleware]] is a classic example: each function inspects the request and calls `next()` to continue the chain.
