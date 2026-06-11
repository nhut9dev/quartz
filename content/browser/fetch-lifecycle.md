---
title: Fetch lifecycle
description: The browser path from starting a fetch request to receiving or failing a response.
tags:
  - browser
  - network
---

The **fetch lifecycle** includes request creation, service worker interception, cache checks, CORS checks, network transfer, response streaming, and abort handling.

Failures can happen before the server sees the request. DNS, TLS, mixed content, CORS, offline state, and abort signals may all surface as client-side failures.

For application code, design around cancellation, timeout, retry, and clear error states. See [[../javascript/fetch-api|Fetch API]] and [[../dom/abort-controller|AbortController]].
