---
title: Secret rotation
description: Replacing secrets so old credentials no longer grant access.
tags:
  - security
  - deployment
---

**Secret rotation** replaces secrets so old credentials no longer grant access.

Secrets include API keys, database passwords, signing keys, OAuth client secrets, and webhook signing secrets.

Safe rotation usually supports both old and new secrets during a transition window, verifies that clients have moved, then revokes the old secret.

This is the security view of [[../sre/secret-rotation|secret rotation]] and complements [[../deployment/secrets-management|secrets management]].
