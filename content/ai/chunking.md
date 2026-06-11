---
title: Chunking
description: Splitting documents into pieces for embedding, retrieval, or model context.
tags:
  - ai
  - llm
---

**Chunking** splits large documents into smaller pieces that can be embedded, searched, or added to a model context.

Chunks should preserve enough meaning to answer likely questions without being so large that retrieval becomes noisy.

Common strategies split by headings, paragraphs, sections, tokens, or semantic boundaries.

Chunk quality strongly affects [[rag|RAG]] because retrieved chunks become the evidence the model uses.
