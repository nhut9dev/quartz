---
title: Secret
description: A Kubernetes object for sensitive configuration such as tokens, passwords, and keys.
tags:
  - kubernetes
  - security
---

**Secret** is a Kubernetes object for sensitive configuration such as tokens, passwords, and keys.

Secrets can be mounted into [[pod|pods]] as files or exposed as environment variables. They separate sensitive runtime configuration from the image and manifest defaults.

Kubernetes Secrets are not automatically a complete secret-management system. Access control, encryption at rest, rotation, and audit behavior depend on cluster configuration.

For production, pair Secrets with least privilege and a rotation process. See [[../security/secret-rotation|secret rotation]].
