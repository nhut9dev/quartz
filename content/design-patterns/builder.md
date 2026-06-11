---
title: Builder
description: Constructing a complex object step by step, separating construction from representation.
tags:
  - design-patterns
---

The **builder** pattern constructs a complex object through a series of steps, keeping the assembly logic separate from the object's final representation.

Instead of a constructor with many parameters, you call small, named methods that each set one part, then a final `build()` returns the finished object.

Use it when an object has many optional fields, requires validation across steps, or can be assembled in different configurations from the same process.

The tradeoff is more code than a plain constructor, justified only when construction is genuinely complex.

It complements the [[factory|Factory]], which decides *which* object to create, while builder controls *how* it is assembled.
