---
title: Dependency injection
description: Passing dependencies into code instead of creating them internally.
tags:
  - design-patterns
---

**Dependency injection** provides a [[module-import-export|module's]] dependencies from the outside. In React, [[react-context|context]] is a common way to inject shared dependencies.

This makes code easier to test and swap because the module does not hard-code how dependencies are created.

It is useful for services, repositories, [[api-client|API clients]], clocks, loggers, and configuration.
