#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-ex-02 --ignore-not-found --wait=true >/dev/null
echo "Level 02 cleaned."
