---
title: CSS-in-JS
description: Styling approaches that define CSS through JavaScript or TypeScript.
tags:
  - css
  - frontend
---

**CSS-in-JS** defines styles from JavaScript or TypeScript code, usually colocated with the component that uses them.

```jsx
const Button = styled.button`
  background: ${props => props.theme.colors.brand};
  padding: 8px 12px;
`
```

## How it works

There are two generations. **Runtime** libraries (styled-components, Emotion) parse template literals or objects in the browser, generate unique class names, and inject `<style>` tags as components render — which is how `${props => ...}` can produce different CSS per render. **Zero-runtime / compile-time** libraries (vanilla-extract, Linaria, StyleX, Panda CSS) extract the same authoring experience into static CSS files at build time, so nothing runs in the browser to produce styles.

## When to use

Reach for CSS-in-JS when styles need to be **colocated with component logic** and **derived from props or a theme** — a design system with many themeable variants, or components whose styling genuinely depends on runtime values. If styles are static and don't depend on props, [[css-modules|CSS Modules]] or [[../tailwind/index|Tailwind]] give similar colocation/scoping without any runtime cost.

## Trade-offs

Runtime CSS-in-JS adds JavaScript bundle size and a style-injection cost on every mount, and needs an SSR extraction step (collecting styles during render and inlining them) or users see a flash of unstyled content. Zero-runtime libraries remove that cost by resolving styles at build time, but in exchange they restrict how dynamic a style can be — interpolating an arbitrary runtime value usually has to go through a CSS variable instead of generating new CSS on the fly. Tailwind and CSS Modules avoid the dynamic-styling question entirely by keeping all class names static.

## Pitfalls

Runtime CSS-in-JS and **React Server Components** don't mix: there's no client-side render pass during RSC to inject `<style>` tags, which is why styled-components/Emotion need a client boundary or don't work at all in the App Router — a major reason teams moved toward Tailwind or zero-runtime tools for new Next.js projects. Dynamically generated class names also churn snapshot tests and can defeat CSS caching unless the library hashes styles deterministically. And theme objects threaded through `props => ...` couple every styled component to the theme's shape, making it harder to change the theme structure later.
