---
title: Merge conflict
description: A Git state where changes cannot be combined automatically.
tags:
  - git
---

A **merge conflict** happens when Git cannot automatically combine changes from different [[branch|branches]].

Conflicts usually happen when two branches edit the same lines or when one branch deletes a file that another branch edits.

Resolving a conflict means choosing the final content, removing conflict markers, and [[commit|committing]] the result. The important part is not just making Git happy, but preserving the intended behavior from both changes.
