---
title: Backend Roadmap
description: Tổng hợp các mục kiến thức Backend hiện có và checklist các chủ đề cần viết thêm
draft: true
---

## Đã có

### Ngôn ngữ & Runtime

- [[node/index|Node.js]] — event loop, streams, buffer, cluster, worker threads, crypto, package.json
- [[express/index|Express]] — app, router, middleware, route handler, error handling
- [[go/index|Go]] — goroutines, channels, scheduler, error handling, garbage collection

### Database & Data

- [[database/index|Database]] — SQL, schema, index, transaction, isolation level, replication, sharding, ORM (Prisma/Drizzle/TypeORM)
- [[redis/index|Redis]] — data structures, cache, TTL/eviction, pub/sub, cluster, distributed lock, rate limiting
- [[caching/index|Caching]] — cache-aside, write-through, invalidation, stale-while-revalidate, CDN cache, hot key

### API Design

- [[api-design/index|API Design]] — versioning, pagination, idempotency key, error response format, rate limit design, OpenAPI contract
- [[web/api/index|API styles & conventions]] — REST, RPC, tRPC, GraphQL (server, subscription, federation, DataLoader), gRPC/Protobuf, JSON-RPC

### Auth & Security

- [[auth/index|Auth]] — RBAC/ABAC, OAuth flows, OpenID Connect, SSO, MFA, session vs token, passkey
- [[security/index|Security]] — OWASP Top 10, injection, encryption, secrets, threat modeling
- [[web/security/index|Web security]] — CORS, CSRF, XSS, CSP, JWT, cookie, same-origin policy

### Messaging & Background jobs

- [[messaging/index|Messaging]] — message queue, Kafka, RabbitMQ, event-driven, outbox, saga, CQRS, event sourcing
- [[background-jobs/index|Background jobs]] — job queue, BullMQ, scheduled/delayed jobs, worker process

### Kiến trúc & Design Patterns

- [[architecture/index|Architecture]] — microservices, API gateway, circuit breaker, DDD, clean architecture, resilience patterns
- [[design-patterns/index|Design Patterns]] — GoF patterns (factory, strategy, observer, decorator, repository...)
- [[system-design/index|System Design]] — consistent hashing, rate limiter, distributed lock, fan-out, leader-follower, multi-region

### Concurrency & Performance

- [[concurrency/index|Concurrency]] — mutex, semaphore, race condition, thread pool, connection pool tuning
- [[backend-performance/index|Backend Performance]] — latency percentiles, load testing, profiling, flame graph, APM

### Networking & Protocols

- [[networking/index|Networking]] — OSI model, TCP/UDP, TLS handshake, HTTP/2, HTTP/3
- [[web/http/index|HTTP & network]] — HTTP semantics, headers, status codes, range request, DNS, TLS

### File Handling

- [[file-handling/index|File Handling]] — upload, multipart, presigned URL, object storage, image processing, virus scanning

### DevOps & Infrastructure

- [[docker/index|Docker]] — image, container, Dockerfile, Compose, multi-stage build, networking, volumes
- [[k8s/index|Kubernetes]] — pod, deployment, service, ingress, configmap/secret, autoscaling, statefulset
- [[deployment/index|Deployment]] — CI, IaC, blue-green, canary, rollback, secrets management, feature flag
- [[observability/index|Observability]] — structured logging, metrics, tracing, OpenTelemetry, SLO/SLI, alerting
- [[sre/index|SRE]] — incident response, postmortem, capacity planning, disaster recovery, golden signals

### Search & Serverless

- [[search/index|Search]] — full-text search, Elasticsearch, vector search
- [[serverless/index|Serverless]] — FaaS, edge function, cold start

### Thuật toán & nền tảng

- [[dsa/index|DSA]] — data structures, algorithms, độ phức tạp, các kỹ thuật giải bài (two-pointer, sliding window, DP, backtracking...)

### Hệ thống & Công cụ

- [[linux/index|Linux]] — shell, process, permission, systemd, cron, SSH
- [[git/index|Git]] — branch, rebase, merge conflict, git flow, hooks

### Domain Knowledge

- [[domains/index|Domains]] — finance, ecommerce, healthcare, ERP, HR/payroll, insurance, logistics, marketplace, real estate, CRM, education

## Cần viết thêm

Các mảng kiến thức lớn đều đã có folder + index. Một khoảng trống đáng chú ý:

- Node framework khác ngoài Express — NestJS, Fastify, Koa (tương tự cách FE có mục "Framework khác" cho Vue/Svelte/Angular/Solid)

## Cần nâng lên Tier 2 (load-bearing topic)

Các note dưới đây hiện đang là Tier 1 (12–16 dòng, chỉ gloss một đoạn) nhưng bản chất là topic có cơ chế + trade-off + failure mode — đúng nơi template khuyến nghị viết sâu với các heading `How it works` / `When to use` / `Trade-offs` / `Pitfalls`. Liệt kê để nâng dần, không cần làm hết một lượt.

### ✅ messaging/ (14 note — đã nâng Tier 2)

`at-least-once-delivery`, `consumer-group`, `cqrs`, `dead-letter-queue`, `event-driven`, `event-sourcing`, `exactly-once`, `idempotent-consumer`, `kafka`, `message-deduplication`, `message-queue`, `outbox-pattern`, `rabbitmq`, `saga`

### ✅ caching/ (11 note — đã nâng Tier 2)

`cache-aside`, `cache-invalidation`, `cache-key`, `cache-stampede`, `cache-warming`, `cdn-cache`, `eviction-policy`, `http-caching`, `multi-layer-cache`, `stale-while-revalidate`, `write-through`

### ✅ architecture/ (11 note — đã nâng Tier 2)

`api-gateway`, `backpressure`, `bulkhead`, `cap-theorem`, `circuit-breaker`, `clean-architecture`, `domain-driven-design`, `eventual-consistency`, `horizontal-vertical-scaling`, `load-balancing`, `monolith-vs-microservices`

### ✅ system-design/ (16 note — đã nâng Tier 2)

`autocomplete-system`, `cache-consistency`, `consistency-model`, `consistent-hashing`, `database-failover`, `distributed-lock`, `fan-out`, `file-storage-system`, `leader-follower-replication`, `load-shedding`, `multi-region-architecture`, `news-feed-system`, `notification-system`, `queue-based-architecture`, `read-replica`, `search-indexing`

### ✅ database/ (22 note — đã nâng Tier 2)

`acid`, `transaction`, `isolation-level`, `deadlock`, `optimistic-locking`, `pessimistic-locking`, `database-index`, `composite-index`, `connection-pool`, `query-optimization`, `query-plan`, `n-plus-one-problem`, `materialized-view`, `replication`, `sharding`, `partitioning`, `nosql`, `cursor-pagination`, `normalization`, `orm`, `soft-delete`, `join`

(`index-internals` và `explain-analyze` đã là Tier 2 từ trước — bỏ qua.)

> **Toàn bộ backlog Tier 2 đã hoàn thành** (74 note: messaging 14, caching 11, architecture 11, system-design 16, database 22).
>
> Giữ Tier 1 (atomic, cố ý): `caching/redis`, `caching/cache-ttl`, `caching/etag`; `database/sql`, `schema`, `migration`, `foreign-key`, `prepared-statement`. Đã đạt từ trước: `architecture/multi-tenancy`, `system-design/rate-limiter`.
