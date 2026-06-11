---
title: Adapter
description: A pattern that makes one interface usable where another interface is expected.
tags:
  - design-patterns
---

An **adapter** translates between two interfaces.

It is useful when integrating third-party libraries, legacy [[module-import-export|modules]], [[api-client|APIs]], or platform-specific implementations.

Adapters keep compatibility code near the boundary instead of spreading conversion logic throughout the application.
