---
title: Facade
description: A simpler interface placed in front of a more complex subsystem.
tags:
  - design-patterns
---

A **facade** hides a complex subsystem behind a smaller, easier API.

For example, an [[api-client|API client]] can expose `getCurrentUser()` instead of making every caller build raw HTTP requests.

Facades are useful when they reduce duplication and protect callers from implementation churn.
