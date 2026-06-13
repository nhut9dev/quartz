---
title: Backend Roadmap
description: A map of backend engineering topics, grouped by area.
draft: false
---

A map of backend engineering areas and the topics under each. Follow a link to dive into a topic's notes.

## Languages & runtime

- [[node/index|Node.js]] — event loop, streams, buffer, cluster, worker threads, crypto, package.json
- [[express/index|Express]] — app, router, middleware, route handlers, error handling
- [[go/index|Go]] — goroutines, channels, scheduler, error handling, garbage collection

## Database & data

- [[database/index|Database]] — SQL, schema, indexing, transactions, isolation levels, replication, sharding, ORM (Prisma/Drizzle/TypeORM)
- [[redis/index|Redis]] — data structures, cache, TTL/eviction, pub/sub, cluster, distributed lock, rate limiting
- [[caching/index|Caching]] — cache-aside, write-through, invalidation, stale-while-revalidate, CDN cache, hot key

## API design

- [[api-design/index|API Design]] — versioning, pagination, idempotency keys, error response format, rate limit design, OpenAPI contracts
- [[web/api/index|API styles & conventions]] — REST, RPC, tRPC, GraphQL (server, subscription, federation, DataLoader), gRPC/Protobuf, JSON-RPC

## Auth & security

- [[auth/index|Auth]] — RBAC/ABAC, OAuth flows, OpenID Connect, SSO, MFA, session vs token, passkeys
- [[security/index|Security]] — OWASP Top 10, injection, encryption, secrets, threat modeling
- [[web/security/index|Web security]] — CORS, CSRF, XSS, CSP, JWT, cookies, same-origin policy

## Messaging & background jobs

- [[messaging/index|Messaging]] — message queues, Kafka, RabbitMQ, event-driven, outbox, saga, CQRS, event sourcing
- [[background-jobs/index|Background jobs]] — job queues, BullMQ, scheduled/delayed jobs, worker processes

## Architecture & design patterns

- [[architecture/index|Architecture]] — microservices, API gateway, circuit breaker, DDD, clean architecture, resilience patterns
- [[design-patterns/index|Design Patterns]] — GoF patterns (factory, strategy, observer, decorator, repository)
- [[system-design/index|System Design]] — consistent hashing, rate limiter, distributed lock, fan-out, leader-follower, multi-region

## Concurrency & performance

- [[concurrency/index|Concurrency]] — mutex, semaphore, race conditions, thread pool, connection pool tuning
- [[backend-performance/index|Backend Performance]] — latency percentiles, load testing, profiling, flame graphs, APM

## Networking & protocols

- [[networking/index|Networking]] — OSI model, TCP/UDP, TLS handshake, HTTP/2, HTTP/3
- [[web/http/index|HTTP & network]] — HTTP semantics, headers, status codes, range requests, DNS, TLS

## File handling

- [[file-handling/index|File Handling]] — uploads, multipart, presigned URLs, object storage, image processing, virus scanning

## DevOps & infrastructure

- [[docker/index|Docker]] — images, containers, Dockerfile, Compose, multi-stage builds, networking, volumes
- [[k8s/index|Kubernetes]] — pods, deployments, services, ingress, configmaps/secrets, autoscaling, statefulsets
- [[deployment/index|Deployment]] — CI, IaC, blue-green, canary, rollback, secrets management, feature flags
- [[observability/index|Observability]] — structured logging, metrics, tracing, OpenTelemetry, SLO/SLI, alerting
- [[sre/index|SRE]] — incident response, postmortem, capacity planning, disaster recovery, golden signals

## Search & serverless

- [[search/index|Search]] — full-text search, Elasticsearch, vector search
- [[serverless/index|Serverless]] — FaaS, edge functions, cold start

## Algorithms & foundations

- [[dsa/index|DSA]] — data structures, algorithms, complexity, problem-solving techniques (two-pointer, sliding window, DP, backtracking)

## Systems & tooling

- [[linux/index|Linux]] — shell, processes, permissions, systemd, cron, SSH
- [[git/index|Git]] — branch, rebase, merge conflicts, git flow, hooks

## Domain knowledge

- [[domains/index|Domains]] — finance, ecommerce, healthcare, ERP, HR/payroll, insurance, logistics, marketplace, real estate, CRM, education
