---
title: Canonical URL
description: The preferred URL for a page when similar or duplicate versions exist.
tags:
  - seo
  - technical-seo
---

**Canonical URL** is the preferred URL for a page when similar or duplicate versions exist.

Canonical tags help search engines consolidate signals across duplicates, such as URLs with tracking parameters, sort orders, print views, or near-identical category pages.

Use canonicals when one version should rank and the others are alternate access paths. They are a hint, not an absolute command, so the page content, links, redirects, and sitemap should agree with the canonical choice.

Bad canonicals can remove important pages from search. Do not point every page to the homepage, canonicalize paginated or filtered pages blindly, or mix canonical signals with contradictory redirects.

## How it works

A `rel="canonical"` link in the page `<head>` (or an equivalent HTTP `Link` header) points search engines to the preferred URL for a piece of content. It's a *hint* the search engine weighs alongside other signals — redirects, internal links, the sitemap, and detected duplicate content — and it can be overridden if those signals disagree with it.

## When to use

Use canonicals for true duplicates and near-duplicates: the same content reachable through different URLs — tracking parameters, session IDs, `http` vs `https`, `www` vs non-`www`, or the same items under different sort orders. A **self-referencing canonical** — a page pointing to its own URL — is standard practice and removes ambiguity for any parameterized variants of that same page.

## Trade-offs

A canonical consolidates ranking signals onto one URL, which simplifies which version competes in search — but it also means non-canonical versions stop being considered for indexing on their own. Canonicalizing a page that actually has unique content — a paginated page with products not shown elsewhere, a filtered view with genuinely different results — hides that content from search rather than just deduplicating it.

## Pitfalls

Because canonical is a hint and not a directive, contradicting it with other signals creates an unresolved tug-of-war: the sitemap lists the non-canonical URL, internal links point to it, or a redirect points the opposite way from the canonical. Search engines resolve this inconsistently. A common large-site mistake is canonicalizing every paginated page (page 2, 3, ...) back to page 1 — this tells search engines those pages' content doesn't exist separately, which can remove deep catalog pages from search entirely. The old fix, `rel=next`/`rel=prev`, is deprecated; the current expectation is that each paginated page with unique content should be independently indexable, not canonicalized away.
