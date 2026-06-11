---
title: Search indexing
description: Preparing data in a search-optimized structure for fast retrieval.
tags:
  - system-design
  - database
---

**Search indexing** prepares data in a structure optimized for search queries.

Applications often write canonical data to a database and asynchronously copy searchable fields into a search index.

The main tradeoff is freshness. Search results may lag behind the source of truth, so the product must tolerate eventual consistency or provide a read-after-write workaround.

Search indexing connects to [[../database/database-index|database indexes]], [[../messaging/event-driven|event-driven architecture]], and [[../architecture/eventual-consistency|eventual consistency]].
