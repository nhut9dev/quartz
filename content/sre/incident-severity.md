---
title: Incident severity
description: A shared scale for describing the impact and urgency of production incidents.
tags:
  - sre
  - incident-response
---

**Incident severity** gives teams a common language for production impact.

A useful severity scale combines user impact, business impact, scope, and urgency. For example, a complete outage for all users deserves different coordination than a degraded admin-only feature.

Severity should drive behavior: who joins, how often updates happen, whether executives are notified, and when a postmortem is required. Keep the scale small enough that people can choose quickly during stress.
