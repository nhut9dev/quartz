---
title: Singleton
description: A pattern that provides one shared instance of something.
tags:
  - design-patterns
---

A **singleton** provides one shared [[object|instance]] across a program.

It is often used for configuration, logging, caches, or [[api-client|clients]] that should be reused.

Singletons can hide global state. They are convenient, but they can make tests and lifecycle management harder.
