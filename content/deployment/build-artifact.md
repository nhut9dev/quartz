---
title: Build artifact
description: The output produced by a build step and deployed or published later.
tags:
  - deployment
  - build
---

A **build artifact** is the output of a build step. It might be compiled JavaScript, static assets, a Docker image, a package, or a server bundle.

Artifacts separate building from deploying. A deployment should usually promote a known artifact instead of rebuilding from changing source code each time.

For frontend apps, artifacts often include minified files, hashed asset names, and source maps from the [[../web/bundler|bundler]].
