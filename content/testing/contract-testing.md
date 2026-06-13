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

## How it works

The consumer writes (or generates) a contract describing the requests it sends and the responses it expects — field names, types, which fields are required. The provider's test suite replays those requests against its real implementation and checks the responses satisfy the contract. Both sides run this independently in their own CI, without either service being deployed or even running at the same time.

## When to use

Use contract tests at boundaries between independently-deployed services, especially where one team's deploy could silently break another team's consumer. They sit between a unit test — too narrow to catch cross-service breakage — and an [[end-to-end-test|end-to-end test]] — too slow and expensive to run on every provider change.

## Trade-offs

Contract tests are fast and need no full stack, but they verify *shape* agreement only — that a response has the fields and types the consumer expects. They don't verify the values are business-correct, so a provider can pass its contract tests while returning a logically wrong but correctly-shaped response.

## Pitfalls

A contract written once and never updated as the consumer's needs evolve goes stale — the provider keeps passing tests against an old contract while the real consumer has moved on and would actually break. Contract tests are also only as good as their coverage: a field the consumer reads but the contract doesn't mention can change or disappear without either side's tests failing.
