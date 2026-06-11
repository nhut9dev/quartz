---
title: NextAuth / Auth.js
description: An authentication library for Next.js and other frameworks with built-in providers and session handling.
tags:
  - auth
  - nextjs
---

**NextAuth** (now **Auth.js**) is an authentication library that wires up sign-in for Next.js and other frameworks, handling providers, sessions, and the security details for you.

## How it works

You configure a set of providers, then NextAuth exposes the routes and handlers for the [[oauth-flows|OAuth flows]]. It supports OAuth providers like Google or GitHub, email magic links, and custom credentials. Sessions can be stored two ways, reflecting the [[session-vs-token|session vs token]] choice: a stateless JWT held in a cookie, or a stateful database session backed by an adapter. Adapters connect the library to your database so users, accounts, and sessions persist. The library also manages callbacks for shaping tokens and sessions, and protects sign-in against CSRF.

```ts
export const { handlers, auth } = NextAuth({
  providers: [GitHub, Google],
  session: { strategy: "jwt" },
})
```

## When to use

Use NextAuth when you want first-class OAuth sign-in in a Next.js or compatible app without hand-building the redirect dance, cookie handling, and CSRF protection. Providers that issue ID tokens rely on [[openid-connect|OpenID Connect]], which NextAuth understands natively.

## Pitfalls

The JWT strategy is convenient but inherits token revocation limits; the database strategy needs an adapter and storage. Customizing tokens and sessions happens inside callbacks, so misconfigured callbacks are a common source of confusing bugs.
