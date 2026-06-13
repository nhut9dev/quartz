---
title: next-intl
description: An i18n library integrating translations with the Next.js App Router.
tags:
  - i18n
  - nextjs
---

**next-intl** is an i18n library built for Next.js's App Router, integrating translations with Server Components, routing, and static rendering.

## How it works

Locale is typically determined by a URL segment (`/en/about`, `/vi/about`) via middleware that matches the request path, redirects to a locale-prefixed path if missing, and sets the locale for that request. Server Components call `getTranslations()` — an async function, since it may load locale JSON from disk or network — while Client Components use `useTranslations()`. Both read from the same message files, but server-side loading happens per-request without shipping translation JSON for unused locales to the client.

## When to use

Use next-intl for App Router projects that need locale-prefixed routing, statically-generated pages per locale (via `generateStaticParams` over locales), and translations available in both Server and Client Components without manually wiring a provider for the server side.

## Trade-offs

Locale-prefixed routing (`/en/...`, `/vi/...`) makes each locale's pages independently cacheable and statically-generatable by the CDN — but every internal link needs to be locale-aware. next-intl provides a wrapped `Link`/`useRouter` for this, and a plain `<a href="/about">` or unwrapped `next/link` silently links to the wrong or unprefixed locale.

## Pitfalls

Translation messages loaded in a Server Component aren't automatically available to Client Components — passing translated strings as props from server to client works, but a Client Component calling `useTranslations()` needs its own provider set up with the right messages, easy to miss in a mixed server/client tree. Middleware-based locale detection can also conflict with other middleware, like auth redirects, if ordering isn't considered — a redirect loop between "add locale prefix" and "redirect unauthenticated user" is a common integration bug.
