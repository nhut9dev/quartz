---
title: Go modules
description: Go's dependency management system based on go.mod, semantic versioning, and minimal version selection.
tags:
  - go
  - tooling
---

**Go modules** are Go's built-in dependency management system, declaring a project's dependencies and their versions in a `go.mod` file.

## How it works

`go.mod` lists the module path, the Go version, and required dependencies with their semantic versions; `go.sum` records cryptographic checksums so every build verifies it fetched the exact same code. Go uses **semantic import versioning** — a major version bump (v2+) changes the import path itself (`example.com/lib/v2`), so incompatible versions can coexist.

To resolve versions Go uses **minimal version selection (MVS)**: it picks the *lowest* version that satisfies all requirements, rather than the newest allowed. Builds are therefore reproducible by default, without a separate lockfile resolution step. You can `go mod vendor` to copy dependencies into a `vendor/` directory for hermetic, offline builds.

## vs package.json

[[../node/package-json|package.json]] uses semver *ranges* (`^1.2.0`) resolved at install time, so two installs can differ unless a `package-lock.json` pins them; resolution favors the newest compatible version. Go inverts this: versions are recorded exactly in `go.mod`, MVS favors the minimum, and `go.sum` guarantees integrity — so what you build is deterministic without extra tooling.

## Pitfalls

Forgetting the `/v2` suffix when importing a major version pulls in the wrong, incompatible release. Editing `go.mod` by hand and skipping `go mod tidy` leaves stale or missing requirements.
