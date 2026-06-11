---
title: commitlint
description: A tool that checks commit messages against a configured convention.
tags:
  - git
  - tooling
---

**commitlint** is a tool that checks commit messages against a configured convention.

It is commonly used with [[conventional-commits|Conventional Commits]] and a Git `commit-msg` hook managed by [[husky|Husky]]. The hook rejects commit messages that do not match the configured rules.

Use commitlint when commit messages feed automation or when a team wants consistent history before review.

The pitfall is enforcing rules that the team has not documented. A strict commit rule without examples creates friction and encourages people to bypass hooks.
