---
title: Observer
description: A pattern where subscribers react to changes from a subject.
tags:
  - design-patterns
---

The **observer** pattern lets subscribers listen for changes from a subject. It is closely related to [[pub-sub|pub/sub]], but observers usually hold a direct reference to the subject.

When the subject changes, it notifies observers without needing to know exactly what each observer does.

DOM events, stores, and reactive systems commonly use observer-like behavior.
