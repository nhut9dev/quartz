---
title: Testcontainers
description: Running real dependencies in throwaway Docker containers for tests.
tags:
  - testing
  - docker
---

**Testcontainers** spins up real services like Postgres, Redis, or Kafka inside disposable [[../docker/docker-container|Docker containers]] so tests run against the actual dependency instead of a mock.

## How it works

The test code starts a container, waits until it is ready, hands its host and mapped port to the application, runs the test, then stops the container.

```ts
const pg = await new PostgreSqlContainer().start();
const url = pg.getConnectionUri();
// run migrations, run tests
await pg.stop();
```

Ports are mapped randomly so parallel tests do not collide, and a readiness check (log line or health probe) prevents connecting before the service is up.

## When to use

Reach for it in [[integration-test|integration tests]] where mock or in-memory substitutes drift from reality, such as SQL dialect quirks, Redis eviction, or Kafka rebalancing.

It also validates that [[../database/migration|migrations]] apply cleanly against a fresh, real database.

## Pitfalls

Containers are slow to start and need Docker available in CI, which raises cost and flakiness if readiness checks are weak.

Reuse containers across a suite when isolation allows; otherwise per-test startup dominates runtime. Always stop containers so CI runners do not leak resources.
