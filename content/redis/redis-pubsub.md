---
title: Redis Pub/Sub
description: Redis messaging where publishers send messages to channels and subscribers receive them live.
tags:
  - redis
  - messaging
---

**Redis Pub/Sub** is Redis messaging where publishers send messages to channels and subscribers receive them live.

It is useful for lightweight fan-out, cache invalidation signals, websocket broadcasts, and local coordination between app instances. Subscribers receive messages only while they are connected.

Use Pub/Sub when losing a message is acceptable or the message can be reconstructed. For durable workflows, use a real message queue or Redis Streams instead of plain Pub/Sub.

The pitfall is assuming Pub/Sub stores messages. It does not provide durable delivery, replay, or consumer groups by itself.
