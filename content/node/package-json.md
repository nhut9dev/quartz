---
title: package.json
description: The manifest file that describes a JavaScript or Node.js package.
tags:
  - node
  - npm
---

`package.json` is the manifest for a JavaScript package. It describes metadata, scripts, dependencies, entry points, and package manager settings.

```json
{
  "scripts": {
    "dev": "vite",
    "test": "jest"
  },
  "dependencies": {
    "express": "^4.18.0"
  }
}
```

Applications use it to coordinate install and run commands. Libraries use it to describe what they expose to other projects.
