---
title: Contract testing
description: Verifying that a provider and consumer agree on an API shape.
tags:
  - testing
---

**Contract testing** verifies that two services, a provider and a consumer, agree on the shape of the API between them.

The consumer defines the requests it makes and the responses it expects; the provider is tested against that contract.

This catches breaking changes, like a renamed field or changed type, without spinning up the full stack required for an [[end-to-end-test|end-to-end test]].

Tools such as Pact let each side run independently while still guaranteeing they fit together.

It shines in microservice systems where teams deploy services on separate schedules.
