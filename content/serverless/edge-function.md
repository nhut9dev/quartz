---
title: Edge function
description: Serverless code run at CDN edge locations close to the user.
tags:
  - serverless
  - edge
  - performance
---

**Edge functions** run your code at CDN points of presence (POPs) physically close to the user.

## How it works

Instead of running in one region, the function is deployed across the CDN's global edge, so requests are served from the nearest POP. This cuts network round-trip time dramatically and gives very low latency. The runtime is constrained: no full Node.js, limited APIs, and strict caps on execution time and memory.

## When to use

Best for small, fast work on the request path: authentication checks, redirects, header rewrites, geolocation routing, personalization, and A/B testing. Pairs naturally with the [[../caching/cdn-cache|CDN cache]] sitting at the same edge.

## Tradeoffs

Versus regional [[faas|FaaS]], edge functions trade capability for proximity. The tight runtime and time/memory limits rule out heavy compute, large dependencies, or long database transactions; keep those in regional functions. The minimal runtime also reduces (but does not eliminate) [[cold-start|cold starts]].
