---
title: Module federation
description: Loading and sharing modules across separately built apps at runtime.
tags:
  - frontend-architecture
---

**Module federation** lets one built application load JavaScript modules from another built application at runtime, instead of bundling everything together.

A host app pulls in remote modules, and both sides can share common dependencies like React so they are downloaded once.

It is supported by bundlers such as Webpack and Vite, and is a common way to wire up a [[micro-frontend|micro-frontend]] system.

The benefit is independent deployment: a remote can ship new code that the host picks up without rebuilding.

The tradeoff is version risk. Mismatched shared dependencies, type safety gaps, and runtime loading failures need careful handling and a clear [[error-handling-strategy|error handling strategy]].

## How it works

At build time, a "remote" app declares which of its modules are exposed (e.g. a `ProductCard` component) and which dependencies it can share (React, a design system). A "host" app declares which remotes it consumes and what it can share back. At runtime, the host fetches a small remote entry manifest, and only loads the actual remote module's code when it's first referenced — typically behind a lazy/dynamic import on a route. For shared dependencies, both sides resolve against a common "shared scope": if host and remote both mark React as shared with compatible version ranges, only one copy is downloaded and used; if marked `singleton: true`, federation forces a single instance even if versions differ slightly.

## When to use

Module federation is the runtime composition mechanism for [[micro-frontend|micro-frontends]] — reach for it when remotes genuinely need to deploy independently and have the host pick up new code without a host rebuild. For a single team shipping one bundled SPA, it adds machinery (remote manifests, shared-scope configuration, runtime loading) that a normal bundler already handles at build time.

## Trade-offs

The payoff is real independent deployability plus dependency deduplication — a remote ships a new version, the host loads it on next page load, and shared libraries like React download once across the whole composed app. The cost is that dependency compatibility becomes a **runtime** concern instead of a build-time one: a host and remote built at different times, against different versions of a shared dependency, only discover the mismatch when a user loads that combination in production.

## Pitfalls

A version mismatch on a `singleton: true` shared dependency doesn't fail the build — it resolves silently to one version, and if that version is incompatible with what the other side expects, the failure mode is runtime errors like "Invalid hook call" inside the remote's components, with no obvious link back to "the host's React version changed." Type safety across the federation boundary also doesn't come for free — TypeScript checks each app's own code at build time, but the *shape* of what a remote exposes isn't checked against what the host expects unless you add shared type packages or codegen, so a remote can change its exposed module's interface and the host won't know until it breaks at runtime.
