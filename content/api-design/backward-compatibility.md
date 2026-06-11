---
title: Backward compatibility
description: Keeping existing clients working when an API evolves.
tags:
  - api
  - architecture
---

**Backward compatibility** means existing clients keep working after an API changes.

Safe changes are usually additive: new optional fields, new enum values clients can ignore, new endpoints, or broader accepted input.

Risky changes include removing fields, changing field meaning, narrowing validation, changing default behavior, or returning a different shape for the same endpoint.

Backward compatibility reduces the need for frequent [[api-versioning|API versioning]] and makes deployments safer across independently released clients and servers.
