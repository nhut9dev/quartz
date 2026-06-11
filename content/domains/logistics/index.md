---
title: Logistics
description: Domain notes about shipment, warehouse, tracking, routing, and last-mile delivery workflows.
tags:
  - domains
  - logistics
  - index
---

**Logistics** systems coordinate the movement of goods through warehouses, carriers, routes, delivery agents, and customers.

The domain is event-heavy because the physical world changes state outside the software system. A parcel can be scanned, delayed, damaged, rerouted, delivered, or returned.

## Core concepts

- [[shipment|Shipment]]
- [[tracking|Tracking]]
- [[warehouse|Warehouse]]
- [[last-mile-delivery|Last-mile delivery]]

## Related technical foundations

- [[../../messaging/event-driven|Event-driven]]
- [[../../web/realtime/websocket|WebSocket]]
- [[../../database/optimistic-locking|Optimistic locking]]
- [[../../system-design/notification-system|Notification system]]
