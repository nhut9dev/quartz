---
title: shadcn/ui
description: Copyable React components built with Tailwind CSS and Radix UI.
tags:
  - react
  - ui
  - library
---

**shadcn/ui** is a collection of copyable React components built with [[tailwind-css|Tailwind CSS]] and [[radix-ui|Radix UI]].

It is not a traditional installed component library where every component stays hidden inside `node_modules`. You add component source code to your project and own it.

Use it when you want a strong starting point for accessible, customizable UI without giving up control over component code.

```txt
npx shadcn@latest add button dialog dropdown-menu
```

After adding a component, it lives in your source tree. You can change markup, styles, variants, and behavior like any other local component.

That ownership is the main difference from [[mui|MUI]]. shadcn/ui gives less as a packaged platform, but it is easier to adapt when the design system should become yours instead of staying tied to a library's defaults.
