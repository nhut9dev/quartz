---
title: Pub/sub
description: A messaging pattern where publishers and subscribers communicate through topics.
tags:
  - design-patterns
---

**Pub/sub** lets publishers send messages to a topic while subscribers receive messages from that topic.

Publishers do not need direct references to subscribers, which is the main difference from the [[observer|observer]] pattern.

This decoupling is useful for events and integrations, but too much pub/sub can make control flow hard to trace.
