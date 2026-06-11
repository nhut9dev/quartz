---
title: Module federation
description: Loading and sharing modules across separately built apps at runtime.
tags:
  - frontend-architecture
---

**Module federation** lets one built application load JavaScript modules from another built application at runtime, instead of bundling everything together.

A host app pulls in remote modules, and both sides can share common dependencies like React so they are downloaded once.

It is supported by bundlers such as Webpack and Vite, and is a common way to wire up a [[micro-frontend|micro-frontend]] system.

The benefit is independent deployment: a remote can ship new code that the host picks up without rebuilding.

The tradeoff is version risk. Mismatched shared dependencies, type safety gaps, and runtime loading failures need careful handling and a clear [[error-handling-strategy|error handling strategy]].
