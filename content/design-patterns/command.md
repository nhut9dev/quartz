---
title: Command
description: Encapsulating a request as an object to enable queueing, logging, and undo.
tags:
  - design-patterns
---

The **command** pattern turns a request into a standalone object that holds the action, its target, and its parameters.

Because the request is now data, it can be stored, queued, logged, scheduled, or replayed. Pairing a command with its inverse enables undo and redo.

Use it for task queues, transactional operations, macro recording, or any place where you want to decouple the sender of an action from its receiver.

The tradeoff is extra indirection: every operation becomes a class or object instead of a direct call.

It often coordinates with a [[mediator|Mediator]] and underpins many editor and job-queue systems.
