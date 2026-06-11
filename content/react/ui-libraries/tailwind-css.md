---
title: Tailwind CSS
description: A utility-first CSS framework commonly used with React.
tags:
  - react
  - css
  - library
---

**Tailwind CSS** is a utility-first CSS framework. Instead of writing many custom class names, you compose small utility classes in markup.

```jsx
function Button() {
  return (
    <button className="rounded bg-black px-3 py-2 text-white">
      Save
    </button>
  )
}
```

Tailwind works well for custom product UI where the team wants design control without writing large CSS files. It pairs often with [[shadcn-ui|shadcn/ui]] and [[radix-ui|Radix UI]].

For the framework itself — configuration, variants, dark mode, and patterns — see [[../../tailwind/|Tailwind topics]].
