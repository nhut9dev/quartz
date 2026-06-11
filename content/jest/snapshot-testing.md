---
title: Snapshot testing
description: Comparing test output against a stored expected snapshot.
tags:
  - jest
  - testing
---

**Snapshot testing** compares a value against a stored expected output. If the value changes, Jest shows a diff and asks whether the snapshot should be updated.

```js
expect(renderedTree).toMatchSnapshot()
```

Snapshots are useful for stable structured output such as serialized UI trees, generated config, or formatted data.

They are weak when they are too large or reviewed casually. A changed snapshot should be treated like a changed assertion, not blindly accepted.
