---
title: API deprecation
description: The process of retiring an API behavior without surprising existing clients.
tags:
  - api
  - compatibility
---

**API deprecation** warns clients that a field, endpoint, or behavior will be removed or changed.

Good deprecation includes a replacement path, dates, changelog entry, telemetry, and direct communication for important clients. The removal date should be based on real client usage, not only internal preference.

Deprecation is part of [[backward-compatibility|backward compatibility]] and [[api-versioning|API versioning]]. If clients cannot migrate safely, the API contract is still active in practice.
