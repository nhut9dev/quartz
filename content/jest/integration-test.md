---
title: Integration test
description: A test that checks multiple parts working together.
tags:
  - jest
  - testing
---

An **integration test** checks that multiple parts of the system work together. It might cover a route, controller, service, database adapter, or API client.

Compared with a [[jest/unit-test|unit test]], an integration test uses fewer mocks and exercises more real wiring.

```txt
HTTP route -> controller -> service -> database test double
```

Integration tests are slower and broader, but they catch problems that isolated tests miss: mismatched data shapes, missing middleware, wrong configuration, and broken boundaries.
