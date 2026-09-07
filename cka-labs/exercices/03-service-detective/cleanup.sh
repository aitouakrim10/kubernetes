#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-ex-03 --ignore-not-found --wait=true >/dev/null
echo "Level 03 cleaned."
