---
title: Semantic Versioning
description: A versioning convention — MAJOR.MINOR.PATCH — that signals what a release changes.
tags:
  - web
  - tooling
  - versioning
---

**Semantic Versioning** is a versioning convention of the form `MAJOR.MINOR.PATCH` (e.g. `2.4.1`). You bump MAJOR for breaking changes, MINOR for backward-compatible features, and PATCH for fixes. The number itself tells consumers what a version change will do to them.

This is what makes safe automatic upgrades possible. Package managers use ranges like `^1.2.0` to accept any new MINOR or PATCH but stop at the next MAJOR, where breakage is allowed. It governs npm packages on [[node-runtime|Node.js]], so a project can pull in bug fixes without inviting surprises.

```txt
1.2.3 -> 1.2.4  patch fix
1.2.3 -> 1.3.0  compatible feature
1.2.3 -> 2.0.0  breaking change
```

A breaking change is anything that can make existing consumers fail: removing an export, changing a function signature, renaming a field, or tightening accepted input. Adding a new optional field is usually a MINOR change, while fixing a bug without changing the public contract is PATCH.

Semantic Versioning only works when a project is honest about its public API. If releases break compatibility without a MAJOR bump, version ranges stop being trustworthy.
