---
title: Structured output
description: Constraining model responses to a predictable machine-readable shape.
tags:
  - ai
  - llm
---

**Structured output** asks a model to return data in a predictable format such as JSON.

It is useful when an AI response feeds application code, databases, forms, workflows, or API calls.

Schemas reduce parsing errors and make validation easier, but the application should still treat model output as untrusted input.

Structured output pairs well with [[tool-use|tool use]] because tools usually require typed arguments.
