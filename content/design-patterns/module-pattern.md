---
title: Module pattern
description: Encapsulating related state and behavior behind a module boundary.
tags:
  - design-patterns
  - javascript
---

The **module pattern** groups related code and exposes only the parts other code should use. The classic form relies on a [[closure|closure]] to keep private state hidden.

[[module-import-export|Modern JavaScript modules]] provide this naturally with `import` and `export`.

Good modules hide implementation details and make dependencies explicit.
