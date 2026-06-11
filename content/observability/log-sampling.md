---
title: Log sampling
description: Reducing log volume by keeping a representative subset of events.
tags:
  - observability
  - logging
---

**Log sampling** keeps some log events and drops others to reduce cost and noise.

Sampling works best for high-volume, repetitive events. Errors, security events, payment events, and rare state transitions often need full retention or special sampling rules.

Always know what sampling can hide. Debugging an incident is much harder if the only useful event type was sampled too aggressively.
