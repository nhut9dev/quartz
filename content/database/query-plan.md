---
title: Query plan
description: The database execution strategy chosen for a query.
tags:
  - database
  - performance
---

A **query plan** is the step-by-step strategy the database's planner chooses to execute a query — which tables to scan, which indexes to use, how to join, how to sort — selected by estimated cost before a single row is read.

## What it contains

SQL is *declarative*: you state what data you want, not how to get it. The planner's job is to turn that into a concrete procedure. For a given query there are many possible plans — scan the table or use an index; join A-to-B or B-to-A; nested loop or hash join — and the planner estimates the cost of each (based on table statistics) and picks the cheapest. The plan is a tree of operators: scans at the leaves feed joins and sorts above them, up to the final result.

## Reading one

You inspect it with `EXPLAIN`, reading from the most-indented (innermost) node outward, since inner nodes feed their parents. The operators tell the story: a **Seq Scan** reads the whole table (fine when small or returning most rows, a red flag on a large filtered query); an **Index Scan** uses an index to jump to matching rows; a **Nested Loop** join suits small inputs while a **Hash Join** suits large ones. To see *measured* timings instead of estimates, [[explain-analyze|EXPLAIN ANALYZE]] runs the query and reports actual rows and time.

## Why it matters

The plan is the bridge between a query and its real performance — it's how you confirm an [[database-index|index]] is actually used, diagnose why a query is slow, and verify a change helped rather than assuming it did. A query can be logically correct but choose a terrible plan (a missing index, a stale-statistics misestimate that picks the wrong join), and the plan is the only place that's visible. Reading plans is the core skill behind [[query-optimization|query optimization]] — without it, tuning is guesswork.
