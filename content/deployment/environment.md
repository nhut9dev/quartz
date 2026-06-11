---
title: Environment
description: A runtime context such as local development, staging, or production.
tags:
  - deployment
  - configuration
---

An **environment** is a runtime context for an app. Common environments include local development, test, staging, and production.

Each environment can have different configuration, data, permissions, domains, and external service credentials. The same code should behave predictably across environments, with differences controlled by [[../node/environment-variable|environment variables]] or platform settings.

Production should be treated as the source of real user impact, not just another place where code happens to run.
