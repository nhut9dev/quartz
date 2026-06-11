---
title: Secrets management
description: Safely storing and providing credentials, tokens, and private keys to applications.
tags:
  - deployment
  - security
---

**Secrets management** handles values that must not be committed to source control: API keys, database passwords, private keys, and signing tokens.

Secrets are usually injected through environment variables, platform secret stores, or dedicated vault systems.

Good secrets management supports rotation, access control, audit history, and different values per environment.

Treat secrets as operational data. They should not live in Git, logs, screenshots, or client-side bundles.
