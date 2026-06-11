---
title: Mediator
description: A central object that coordinates interactions so components do not reference each other directly.
tags:
  - design-patterns
---

The **mediator** pattern routes communication between components through one central object, so they collaborate without holding direct references to each other.

Each component talks only to the mediator, which decides how to react and notifies the others. This turns a tangle of many-to-many links into simple hub-and-spoke connections.

Use it when components are tightly coupled by mutual references, such as form fields that enable or disable one another, or chat participants in a room.

The tradeoff is that the mediator can grow into a complex god object as logic accumulates.

It contrasts with [[observer|Observer]] and [[pub-sub|Pub/sub]], where senders broadcast without a coordinator deciding outcomes.
