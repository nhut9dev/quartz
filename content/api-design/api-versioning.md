---
title: API versioning
description: A strategy for changing an API without breaking existing clients.
tags:
  - api
  - web
---

**API versioning** is a strategy for changing an API while existing clients keep working.

Common approaches include URL versions like `/v1/users`, header-based versions, date-based versions, and gradual compatibility without an explicit version.

Versioning is most useful for breaking changes: renamed fields, changed meanings, removed behavior, or incompatible response shapes.

Small additive changes usually do not need a new version if the API follows [[backward-compatibility|backward compatibility]] rules.
