---
title: Secret rotation
description: Replacing credentials before or after they become risky.
tags:
  - sre
  - security
---

**Secret rotation** replaces credentials so old values stop being useful.

Rotation is needed after suspected exposure, employee or vendor changes, regular compliance windows, or migration to stronger credentials.

Good rotation supports overlap: deploy consumers that can read the new secret, update producers, verify usage, then revoke the old secret.

Secret rotation complements [[../deployment/secrets-management|secrets management]] and [[../security/principle-of-least-privilege|least privilege]].
