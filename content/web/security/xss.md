---
title: XSS
description: An attack where untrusted code runs inside a trusted web page.
tags:
  - web
  - security
---

**XSS** (cross-site scripting) happens when untrusted input becomes executable JavaScript inside a page. Once running, that script acts with the page's full privileges — reading visible data, sending authenticated requests, changing the UI, or stealing tokens kept in JavaScript-readable storage.

## Types

**Stored** XSS persists the payload on the server (a comment, a profile field) and serves it to every viewer. **Reflected** XSS bounces an unescaped value straight back from the request (a search term in the results page). **DOM-based** XSS never touches the server — client code writes attacker-controlled input into the page via `innerHTML`, `document.write`, or a dangerous sink.

## Defenses

Let the framework escape output by default (React, for instance, escapes text it renders) and avoid the escape hatches — `dangerouslySetInnerHTML`, raw `innerHTML`, `eval`. When you must render user-supplied HTML, sanitize it with a vetted library rather than a homemade regex. Add [[content-security-policy|Content Security Policy]] as a defense-in-depth layer that limits what injected script can do even if something slips through.

## Pitfalls

Escaping is context-dependent — HTML body, attribute, URL, and inline-JS contexts each need different encoding, so "I escaped it" isn't enough if it's the wrong kind. Keeping auth in `HttpOnly` [[cookie|cookies]] stops token *theft*, but an XSS script can still act *as* the user via same-site requests, so XSS is never just a storage problem. And a CSP with `unsafe-inline` gives most of its protection away.
