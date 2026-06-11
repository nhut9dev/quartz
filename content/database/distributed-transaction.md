---
title: Distributed transaction
description: A transaction that must commit atomically across more than one database or service.
tags:
  - database
  - distributed-systems
---

A **distributed transaction** spans multiple databases or services that must all commit or all abort together.

## How it works

The classic protocol is **two-phase commit (2PC)**. A coordinator first sends a *prepare* to every participant; each does the work, locks the rows, and replies "ready" only if it can guarantee a commit. If all vote ready, the coordinator sends *commit*; if any votes no, it sends *abort*. The two phases give the atomic all-or-nothing guarantee across nodes.

## Pitfalls

2PC is a **blocking protocol**. Between voting "ready" and hearing the decision, a participant holds locks and cannot proceed on its own. If the coordinator crashes after participants prepare, they stay blocked, holding locks, until it recovers. This couples availability to the coordinator and hurts throughput under contention.

## Tradeoffs

Because of the blocking and operational cost, most teams avoid 2PC across service boundaries. The common alternative is to give up atomicity for [[../architecture/eventual-consistency|eventual consistency]] using a [[../messaging/saga|saga]] of local transactions with compensating actions, plus the [[../messaging/outbox-pattern|outbox pattern]] to publish events reliably. This trades a hard global guarantee for availability and partition tolerance, the choice framed by the [[../architecture/cap-theorem|CAP theorem]].
