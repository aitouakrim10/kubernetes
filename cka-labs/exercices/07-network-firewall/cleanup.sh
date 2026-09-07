#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-ex-07 --ignore-not-found --wait=true >/dev/null
echo "Level 07 cleaned."
