---
title: Search indexing
description: Preparing data in a search-optimized structure for fast retrieval.
tags:
  - system-design
  - database
---

**Search indexing** copies data into a structure optimized for search queries — full-text matching, relevance ranking, faceting — that a transactional database can't do efficiently.

## How it works

The canonical data stays in the primary database (the system of record); searchable fields are copied **asynchronously** into a dedicated search index (Elasticsearch, OpenSearch, a Postgres GIN index). The index inverts the data — mapping terms to the documents containing them (an *inverted index*) — so a text query is a fast lookup over terms rather than a scan over rows. Updates flow from the database to the index via a pipeline: change-data-capture, an [[../messaging/event-driven|event]] on write, or a periodic reindex job.

The reason it's a *separate* index and not just a [[../database/database-index|database index]] is that search workloads (ranking, fuzzy matching, aggregations across many fields) need data structures and a query engine the operational database isn't built for.

## When to use

Use a dedicated search index when you need relevance-ranked full-text search, typo tolerance, faceted filtering, or fast aggregation over large datasets — anything a `LIKE '%term%'` query does slowly and badly. For small datasets or exact-match lookups, the operational database's own indexes are simpler and avoid the sync problem entirely.

## Pitfalls

The core trade-off is **freshness**: the index lags the source by the pipeline delay, so a just-created record may not appear in search for seconds — the product must tolerate [[../architecture/eventual-consistency|eventual consistency]] or special-case a read-after-write path. The two stores can also **drift**: a failed sync or a bug leaves the index missing or stale records with no error, so you need reconciliation (periodic full reindex, or audits) to catch divergence. And the index is derived data — it must be rebuildable from the source of truth, never the only place a fact lives.
