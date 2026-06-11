#!/usr/bin/env bash
# Quartz local dev helper.
# On a fresh clone the community plugins must be installed first (this generates
# .quartz/plugins/index.ts, which quartz/components/Head.tsx imports). Without it
# `quartz build` fails with "Could not resolve ../../.quartz/plugins".
#
# Usage:
#   ./serve.sh                 # install plugins if needed, then serve content/ on :8080
#   ./serve.sh --port 8081     # extra args are passed through to `quartz build --serve`
#   ./serve.sh build           # static build only (no server), output to public/
set -euo pipefail

cd "$(dirname "$0")"

if [ ! -f .quartz/plugins/index.ts ]; then
  echo "→ First run: installing community plugins from lockfile..."
  npx quartz plugin install
fi

if [ "${1:-}" = "build" ]; then
  shift
  exec npx quartz build "$@"
fi

echo "→ Serving content/ at http://localhost:8080 (hot-reload on .md changes)"
exec npx quartz build --serve "$@"
