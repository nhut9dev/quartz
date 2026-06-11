---
title: Threat modeling
description: Systematically identifying threats and mitigations early in design.
tags:
  - security
---

**Threat modeling** is the practice of systematically identifying what could go wrong with a system and how to mitigate it.

It is done early, during design, so that security is shaped into the architecture rather than bolted on later.

A common framework is STRIDE: spoofing, tampering, repudiation, information disclosure, denial of service, and elevation of privilege.

The output is a prioritized list of threats, each paired with a mitigation or an accepted risk.

It complements awareness lists like the [[owasp-top-10|OWASP Top 10]] by focusing on your specific data flows and trust boundaries.
