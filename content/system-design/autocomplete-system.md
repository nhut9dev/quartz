---
title: Autocomplete system
description: A search feature that suggests likely completions while the user is typing.
tags:
  - system-design
  - search
  - product
---

An **autocomplete system** returns ranked suggestions as the user types, where the dominating constraint is latency: a suggestion that arrives after the next keystroke is worthless, so the whole design is organized around being fast.

## Core design

Suggestions are served from a structure optimized for **prefix lookup** — a trie, or a search engine's edge-n-gram/completion index — rather than scanning data per request. Each prefix maps to a small set of pre-ranked candidates, so a query is a cheap lookup, not a computation. Ranking blends **popularity** (how often a completion is chosen) with optional personalization, and the top results per prefix are often precomputed and cached. On the client, **debouncing** ([[../javascript/functions/debounce|debounce]]) avoids firing a request per keystroke, and in-flight requests are cancelled when superseded.

## Key decisions

- **Index freshness** — popularity and new terms are usually updated in batch or [[search-indexing|asynchronously]], so the index lags reality; autocomplete almost always tolerates this.
- **Typo tolerance** — fuzzy matching helps users but widens the candidate set and costs latency; a trade to tune.
- **Personalization** — per-user ranking improves relevance but defeats shared caching, since each user's top-N differs.
- **Abuse filtering** — suggestions are user-influenced, so offensive or manipulated completions must be filtered before they're surfaced.

## Bottlenecks and pitfalls

Latency is the product: budget tens of milliseconds end-to-end, which forces precomputation and caching rather than live ranking. The fastest correct answer beats a slower, richer one — when the search backend is slow, **degrade gracefully** (fewer or cached suggestions) instead of blocking the keystroke. Personalization is the subtle trap: it lifts relevance but collapses cache hit rates, so it's applied as a light re-rank on top of shared cached candidates rather than a per-user query. See [[search-indexing|search indexing]].
