---
title: Tree shaking
description: Dead-code elimination that drops exports which are never imported.
tags:
  - web
  - tooling
  - build
---

**Tree shaking** is dead-code elimination for your bundle: the [[bundler]] drops exports that are never imported anywhere in your app, so unused code never ships.

It relies on the static structure of ES modules. Because `import` and `export` statements are analyzable at build time (unlike dynamic `require`), the bundler can prove which exports are reachable and safely prune the rest. The name comes from shaking a tree so the dead leaves fall off.

It works best with ES modules and side-effect-free code. If a module does work just by being imported (mutating globals, registering handlers), the bundler must keep it to be safe, which limits how much can be removed. Marking packages as side-effect-free helps.

The payoff is smaller bundles. Tree shaking pairs with [[minification]] to compress what remains, and complements [[code-splitting]], which controls *when* the surviving code loads.
