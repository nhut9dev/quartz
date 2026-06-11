---
title: Agent
description: An AI workflow that uses a model to decide steps, tools, and intermediate actions.
tags:
  - ai
  - llm
---

An **agent** is an AI workflow where a model can choose actions, call tools, observe results, and continue toward a goal.

Agents are useful when the exact steps are not known upfront or depend on intermediate results.

They need strong boundaries around tools, permissions, memory, evaluation, and failure handling.

Simple deterministic workflows are often easier to test than open-ended agents, so the agent shape should solve a real coordination problem.
