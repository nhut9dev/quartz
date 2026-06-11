---
title: Dependency security
description: Managing risk from third-party packages used by an application.
tags:
  - security
  - dependency
---

**Dependency security** manages risk from packages, plugins, images, and tools maintained outside the project.

Third-party code can introduce vulnerabilities, supply-chain attacks, abandoned packages, or unexpected behavior through updates.

Practical controls include lockfiles in the [[package-json|package manifest]], dependency review, vulnerability scanning, minimal package choice, pinned container images, and regular upgrades guided by [[semantic-versioning|semantic versioning]].

Security scanning is a signal, not a complete answer. Review severity, exploitability, reachability, and whether the vulnerable code path is actually used.
