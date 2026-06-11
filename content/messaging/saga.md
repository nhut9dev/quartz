---
title: Saga
description: A pattern for coordinating a long-running business process across services.
tags:
  - messaging
  - architecture
---

A **saga** breaks a distributed workflow into local [[transaction|transactions]] and compensating actions.

It is used when one ACID transaction cannot span all the [[monolith-vs-microservices|microservices]] involved.

For example, a checkout saga may reserve inventory, create payment, and confirm shipment, with compensations if a later step fails.
