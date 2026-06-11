---
title: Strategy
description: A pattern that swaps behavior by passing interchangeable algorithms.
tags:
  - design-patterns
---

The **strategy** pattern defines interchangeable behaviors behind the same interface. In JavaScript each strategy is often just a [[function|function]], so passing one to another function makes it a [[higher-order-function|higher-order function]].

For example, pricing, sorting, validation, or formatting rules can be passed as strategies.

It is useful when code has many conditional branches that choose between related algorithms.
