---
title: Streaming response
description: Sending model output incrementally as it is generated.
tags:
  - ai
  - llm
---

A **streaming response** sends output [[token|chunks]] to the user as the [[llm|model]] generates them.

Streaming improves perceived latency for chat, writing, coding, and long-form generation.

Applications need to handle partial output, cancellation, retries, and final structured state carefully.
