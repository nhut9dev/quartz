---
title: Autocomplete system
description: A search feature that suggests likely completions while the user is typing.
tags:
  - system-design
  - search
  - product
---

An **autocomplete system** returns suggestions quickly as the user types.

Common designs combine prefix indexes, popularity signals, typo tolerance, caching, and client-side debouncing. The main constraint is latency: suggestions that arrive late feel worse than fewer suggestions that arrive immediately.

Important design choices include personalization, abuse filtering, language support, stale index tolerance, and fallback behavior when the search service is slow. Related notes: [[search-indexing|Search indexing]] and [[../javascript/debounce|Debounce]].
