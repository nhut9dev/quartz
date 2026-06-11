---
title: Tool use
description: Letting a model call external functions or APIs through structured requests.
tags:
  - ai
  - llm
---

**Tool use** lets a [[llm|model]] request an external action through a structured interface.

Tools can fetch data, search files, run calculations, create records, or call [[rest|APIs]].

Tool execution must be guarded by permissions, validation, logging, and clear boundaries. The model should not be treated as the authority for sensitive actions.
