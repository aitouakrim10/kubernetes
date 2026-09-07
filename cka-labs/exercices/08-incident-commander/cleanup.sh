#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-ex-08 --ignore-not-found --wait=true >/dev/null
echo "Level 08 cleaned."
