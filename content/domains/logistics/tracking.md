---
title: Tracking
description: The event history that shows where a shipment is and what happened to it.
tags:
  - domains
  - logistics
---

**Tracking** records shipment events such as label created, picked up, in transit, arrived at facility, out for delivery, delivered, failed delivery, or returned.

Tracking data is often eventually consistent because events come from scanners, carriers, mobile devices, and partner APIs.

The user-facing status should be simpler than the internal event stream. Customers need clear progress, while operations need detailed timestamps and exception codes.

Related notes: [[../../architecture/eventual-consistency|Eventual consistency]], [[../../web/realtime/server-sent-events|Server-sent events]], and [[../../observability/correlation-id|Correlation ID]].
