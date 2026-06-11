---
title: Principle of least privilege
description: Granting each user or service the minimum access required to do its job.
tags:
  - security
---

**The principle of least privilege** says every user, process, and service should have only the access it actually needs.

Limiting privileges shrinks the blast radius when an account or component is compromised.

A web server that only reads from a database should not hold write or admin credentials.

It applies to people, machine identities, API tokens, and cloud roles alike.

It underpins many other controls, from [[ssrf|SSRF]] containment to safe defaults in [[../auth/rbac|RBAC]].
