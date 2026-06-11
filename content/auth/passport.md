---
title: Passport.js
description: Middleware-based authentication for Node and Express with a large ecosystem of strategies.
tags:
  - auth
  - node
  - express
---

**Passport.js** is authentication implemented as Express [[../express/middleware|middleware]], where each authentication method is packaged as a pluggable strategy.

## How it works

You pick one or more strategies from an ecosystem of 500+: local username/password, OAuth providers, JWT, and many others. Passport installs as middleware in the request pipeline; a strategy verifies the incoming credential and attaches the authenticated user to the request. Passport handles the verification step of the [[oauth-flows|OAuth flows]] but stays deliberately unopinionated about everything else, you wire up session storage, serialization, and persistence yourself.

```ts
passport.use(new LocalStrategy((username, password, done) => {
  // verify credentials, then call done(null, user)
}))
```

## Tradeoffs

Being unopinionated is the point: Passport gives you a strategy interface and gets out of the way, so it fits almost any storage and session design. That freedom is also the cost, since you assemble the [[session-vs-token|session vs token]] mechanics, cookie handling, and storage yourself rather than getting them out of the box. It is a low-level toolkit, not a batteries-included solution.

## When to use

Choose Passport for Node/Express apps where you want fine-grained control over the auth flow, need a specific strategy from its large catalog, or are integrating an unusual identity provider that higher-level libraries do not cover.
