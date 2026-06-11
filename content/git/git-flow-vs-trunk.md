---
title: Git Flow vs trunk-based development
description: Two common branching strategies for organizing team work.
tags:
  - git
---

**Git Flow** uses long-lived branches such as `develop`, release branches, and hotfix branches.

**Trunk-based development** keeps work close to one main [[branch]] and uses small, frequent integrations.

Git Flow can suit projects with slower release trains and explicit release stabilization. Trunk-based development fits [[ci|continuous integration]] and frequent deployment.

The important choice is not the label. It is whether branches stay small, tested, and easy to [[merge]].
