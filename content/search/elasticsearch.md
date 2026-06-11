---
title: Elasticsearch
description: A distributed search engine built on Lucene.
tags:
  - search
  - database
---

**Elasticsearch** is a distributed search engine built on Apache Lucene. It stores documents as JSON, builds inverted indexes for [[full-text-search|full-text search]], and spreads data across a cluster so search stays fast as volume grows. It is the workhorse behind product search, log analytics, and observability dashboards.

## How it works

Documents live in an **index**, which is split into **shards** so the data and query load spread across nodes. Each shard can have **replicas** for fault tolerance and read throughput. You query with the **query DSL**, a JSON structure that combines full-text matching, filters, and relevance scoring. Indexing is **near real-time**: a new document is searchable within about a second, not instantly, because of an internal refresh cycle. Beyond matching, **aggregations** compute counts, averages, histograms, and other analytics over the matched set in the same request, which is why it doubles as an analytics engine.

## When to use

Use Elasticsearch when you need ranked text search, faceted filtering, or analytics over large, semi-structured data. As with any [[../system-design/search-indexing|search index]], you typically keep canonical data in a database and copy searchable fields in. It is not a system of record: it favors availability and search performance over the transactions, joins, and strong consistency a relational database gives you.

## Tradeoffs

That power has an operational cost. A cluster needs capacity planning, shard sizing, and tuned heap and JVM settings, and a poorly sharded index is hard to fix after the fact. Because the index is a derived copy, you also own keeping it in sync with the source. For modest needs, a database's built-in full-text features are often enough and far cheaper to run.
