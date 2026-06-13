---
title: Web component
description: A browser-native approach for creating reusable custom elements.
tags:
  - html
  - web
---

A **web component** is a reusable browser-native component built from [[custom-element|custom elements]], [[shadow-dom|shadow DOM]], and `<template>`.

Web components can work across frameworks because the browser understands them as elements.

## How it works

A [[custom-element|custom element]] registers a class with lifecycle callbacks — `connectedCallback` (mounted), `disconnectedCallback` (unmounted), `attributeChangedCallback` (an observed attribute changed) — that the browser calls automatically, similar to a component's mount/unmount/update hooks but without a framework underneath. [[shadow-dom|Shadow DOM]] gives it encapsulated markup and styles, and `<template>` holds inert, cloneable markup the element stamps out on connection. Together these three pieces are why a `<user-card>` works the same whether the page is React, Vue, or plain HTML — the browser itself knows what the tag means.

## When to use

Web components fit shared UI that needs to **outlive or cross framework boundaries**: design-system primitives consumed by teams on different stacks, embeddable third-party widgets, or long-lived components that shouldn't need a rewrite on the next framework migration. For UI that lives entirely inside one app's component tree, the host framework's own component model is usually more productive.

## Trade-offs

The framework-agnostic reach comes at the cost of framework ergonomics: there's no built-in reactivity, state management, or declarative templating — updates to the DOM are imperative unless you add a small library (Lit) on top. Passing rich data (objects, callbacks) as props has historically been awkward because HTML attributes are strings; frameworks pass functions and objects to custom elements differently (React 19 improved this, but older versions needed manual property assignment via refs).

## Pitfalls

Without **Declarative Shadow DOM**, a server-rendered page ships only the custom element's tag — its shadow content is created by JavaScript after hydration, so SEO crawlers and the first paint may not see it. Global styles, resets, and utility CSS like Tailwind don't cross the shadow boundary, so theming has to go through [[../css/css-variable|CSS custom properties]] or `::part` instead of the usual class-based styling. And native form controls placed inside shadow DOM don't participate in a surrounding `<form>`'s submission unless the element explicitly opts into form-associated custom element behavior.
