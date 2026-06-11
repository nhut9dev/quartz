---
title: Shadow DOM
description: A DOM subtree that scopes markup and styles inside a component.
tags:
  - html
  - dom
---

**Shadow DOM** attaches an encapsulated DOM tree to an element, so a component's internal markup and styles stay isolated from the surrounding page. It is the encapsulation half of [[web-component|web components]] and powers some browser-native controls.

```js
const shadow = host.attachShadow({ mode: "open" })
shadow.innerHTML = `<style>p { color: red }</style><slot></slot>`
```

## How encapsulation works

The shadow tree is separate from the page's main ("light") DOM. Styles defined inside it apply only inside it, and the host is styled with the `:host` selector. A `<slot>` projects the element's light-DOM children into the shadow tree at a chosen spot, so a component can wrap content the page author provides.

## Style and event boundaries

Outer CSS does not reach into the shadow tree — except inherited properties and [[../css/css-variable|custom properties]], which pass through and are the intended theming hook (plus `::part` for explicitly exposed pieces). Events that bubble out are *retargeted* to the host, so outside listeners see the component, not its internals.

## Pitfalls

`mode: "closed"` blocks outside access to the shadow root, which complicates testing and tooling for little real security. Global utility CSS (Tailwind, design-system resets) won't apply inside, making theming harder. And accessibility and form participation need care — native form controls inside shadow DOM don't auto-submit unless the element is form-associated.
