---
title: Backend for frontend
description: A dedicated backend tailored to one client's needs that aggregates downstream services.
tags:
  - frontend-architecture
---

**Backend for frontend (BFF)** is a server layer built for one specific client, such as a web app or a mobile app, rather than a single shared API for everyone.

The BFF aggregates and reshapes data from downstream services into exactly the shape that client needs, reducing round trips and over-fetching.

It also becomes the natural home for client-specific concerns like auth token handling, response trimming, and the [[api-client|API client]] contract.

The benefit is a frontend-friendly API that evolves with the UI instead of fighting a one-size-fits-all backend.

The tradeoff is another service to own and deploy, and possible logic duplication across multiple BFFs.
