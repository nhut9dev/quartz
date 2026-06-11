---
title: Supply chain attack
description: A compromise delivered through dependencies or the build pipeline.
tags:
  - security
---

**A supply chain attack** compromises a system indirectly, through the software it depends on rather than the system itself.

Instead of attacking your code, the adversary poisons a library, a package registry, or a build step that you trust.

A single malicious update can reach every project that pulls the dependency.

This is why [[dependency-security|dependency security]] matters: pinning versions, verifying integrity, and limiting what build tools can do.

Securing the pipeline follows the [[principle-of-least-privilege|principle of least privilege]], since build systems often hold powerful credentials.
