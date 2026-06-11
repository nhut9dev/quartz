---
title: Proxy pattern
description: A surrogate object that controls access to another object.
tags:
  - design-patterns
---

The **proxy** pattern provides a stand-in object that controls access to a real object while exposing the same interface.

A *virtual* proxy delays creating an expensive object until needed (lazy loading). A *remote* proxy represents an object on another machine. A *protection* proxy enforces permissions before forwarding calls.

Use it to add access control, caching, lazy initialization, or logging transparently, so callers never know they are talking to a surrogate.

The tradeoff is an extra layer of indirection and the risk of subtly different behavior from the real object.

Structurally similar to a [[decorator|Decorator]], but a proxy governs access rather than adding features. In JavaScript, see [[../javascript/proxy-reflect|Proxy and Reflect]] for the language-level API.
