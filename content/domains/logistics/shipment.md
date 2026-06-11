---
title: Shipment
description: A package or collection of goods moving through a logistics network.
tags:
  - domains
  - logistics
---

A **shipment** represents goods moving from an origin to a destination through one or more logistics steps.

It usually has sender, receiver, addresses, package dimensions, service level, carrier, tracking number, status, and event history.

A shipment is not always the same as an order. One order can split into multiple shipments, and one shipment can contain items from multiple operational picks or packages.

Related notes: [[../ecommerce/order-lifecycle|Order lifecycle]], [[../../messaging/event-sourcing|Event sourcing]], and [[../../api-design/webhook-design|Webhook design]].
