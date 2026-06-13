---
title: i18next
description: A JS i18n framework with namespaced translations, interpolation, and locale-aware plurals.
tags:
  - i18n
  - frontend
---

**i18next** is a JavaScript internationalization framework — translation keys are organized into namespaces and loaded as JSON resource files per language, with built-in interpolation, pluralization, and fallback languages.

## How it works

A call like `t("greeting", { name })` looks up the key `"greeting"` in the current language's loaded resource bundle (e.g. `en/common.json`), substitutes `{{name}}` via interpolation, and falls back to a configured fallback language — or the key itself — if the translation is missing. Namespaces (`common`, `checkout`, `settings`) let an app load only the translation files relevant to the current page or route, rather than one giant file. Pluralization uses each language's actual plural rules — some languages have more than two forms — via suffixes like `_one`/`_other`, resolved through `Intl.PluralRules`.

## When to use

i18next fits apps needing runtime language switching with no rebuild, lazy-loaded namespaces for code-split routes, and locales with non-trivial pluralization or gender rules. For React, react-i18next provides hooks (`useTranslation`) on top of the core library.

## Trade-offs

Splitting translations into namespaces keeps initial bundle and network cost down for large apps with many translated strings — but it adds an organizational layer (which namespace does this key belong to?) and a loading step: a namespace that isn't loaded yet means a missing-translation flash before it arrives.

## Pitfalls

A missing key falls back silently to the fallback language or the key name itself by default — easy to ship a page showing raw `"checkout.confirmButton"` if the fallback behavior isn't configured to warn loudly in development. Interpolated values that contain user input need explicit handling: i18next's interpolation only escapes by default in some configurations, and HTML-rendering translations (the `Trans` component) treat their content as trusted — an [[../web/security/xss|XSS]] risk if user input flows into a translation rendered as HTML.
