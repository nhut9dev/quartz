---
title: MutationObserver
description: A DOM API for watching changes to nodes, attributes, and child lists.
tags:
  - dom
---

**MutationObserver** watches DOM changes.

It can observe added nodes, removed nodes, attribute changes, and text changes.

Use it when integrating with third-party DOM changes or when no direct event is available.

Avoid using it as the primary state model for your own UI. It is easier to update state explicitly when your code controls the changes.
