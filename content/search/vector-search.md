---
title: Vector search
description: Semantic search by embedding text into vectors and finding nearest neighbors.
tags:
  - search
  - ai
---

**Vector search** finds results by meaning, not by shared words. Text is converted into an **embedding**: a high-dimensional vector where similar meanings sit close together. A query becomes a vector too, and search reduces to finding its **nearest neighbors** in that space. So "how do I reset my password" can match a document titled "account recovery steps" even with no words in common.

## How it works

Closeness is usually measured with **cosine similarity**, the angle between two vectors, which ignores magnitude and focuses on direction. Comparing a query against every vector is exact but slow at scale, so engines use **approximate nearest neighbor (ANN)** algorithms that trade a little accuracy for huge speed gains. **HNSW** is the common index: a layered graph you can traverse in roughly logarithmic time. **Vector databases** (or vector indexes inside existing stores) keep these vectors and serve ANN queries.

## When to use

Use vector search when intent matters more than exact terms: semantic Q&A, recommendations, deduplication, and especially as the retrieval step in [[../ai/rag|RAG]], where relevant chunks are fetched to ground an LLM. Compared with [[full-text-search|keyword search]], vectors handle synonyms and paraphrasing but can miss exact identifiers, codes, or rare names that keyword matching nails. **Hybrid search** runs both and merges the scores, getting precise keyword hits and broad semantic recall at once.

## Pitfalls

Quality is capped by the embedding model: results are only as good as the vectors. Embeddings are also opaque, so debugging "why did this match" is harder than reading matched terms. Re-embedding a large corpus after a model change is expensive, and ANN indexes trade exactness for speed, so recall is tunable but never guaranteed.
