---
title: Blue-green deployment
description: A release strategy with two production environments where traffic switches between them.
tags:
  - deployment
---

**Blue-green deployment** keeps two production-capable environments.

One environment serves live traffic while the other receives the new version.

After validation, traffic switches to the new environment. If something fails, traffic can switch back.

This can reduce downtime, but it requires compatible databases, careful [[environment|environment]] configuration, and enough infrastructure capacity.
