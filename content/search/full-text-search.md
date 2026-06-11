---
title: Full-text search
description: Searching text by relevance instead of exact matches.
tags:
  - search
  - performance
---

**Full-text search** finds documents that are relevant to a query rather than rows that match a value exactly. Instead of scanning every document, it pre-builds an **inverted index**: a map from each term to the list of documents containing it. Looking up "coffee" jumps straight to the matching documents, the way a book index points you to pages.

## How it works

Text is first run through **analysis**: tokenization splits it into terms, stop words like "the" and "is" are dropped, and **stemming** reduces words to a root so "running", "runs", and "ran" all match "run". The cleaned terms become the keys of the inverted index. At query time the same analysis runs on the search string, so the query and the documents speak the same vocabulary.

Matching documents are then **ranked**. Classic scoring uses **TF-IDF**: a term matters more when it appears often in a document (term frequency) but less when it appears across many documents (inverse document frequency). **BM25** refines this with saturation and length normalization, so a single page isn't outscored by a long one just because it repeats a word. The result is an ordered list of best matches, not a yes/no filter.

## When to use

Reach for full-text search whenever users type natural language and expect ranked, fuzzy results: product catalogs, documentation, logs, support tickets. A SQL `LIKE '%coffee%'` works for tiny tables but does a full scan, can't use a normal [[../database/database-index|index]] for leading wildcards, ignores relevance, and has no notion of stemming or ranking. Once data grows, you copy searchable fields into a dedicated [[../system-design/search-indexing|search index]] and let an engine like [[elasticsearch|Elasticsearch]] do the work.

## Pitfalls

Analysis must be consistent between indexing and querying, or matches silently disappear. Language matters too: stemming and stop words are language-specific, so a multilingual corpus needs per-language analyzers. The index is a derived copy, so it can lag the source of truth and must be kept in sync.
