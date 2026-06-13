---
title: styled-components
description: A runtime CSS-in-JS library using tagged template literals.
tags:
  - css
  - frontend
---

**styled-components** is a runtime [[css-in-js|CSS-in-JS]] library that defines styled components using tagged template literals, generating a unique class name and injecting the resulting CSS into a `<style>` tag at render time.

```jsx
const Button = styled.button`
  background: ${props => props.theme.colors.brand};
  padding: 8px 12px;
`
```

A `ThemeProvider` passes a shared theme object down through context, so any styled component can read `props.theme` without prop drilling.

For the general trade-offs of runtime CSS-in-JS — bundle size, SSR style extraction, and incompatibility with React Server Components — see [[css-in-js|CSS-in-JS]].
