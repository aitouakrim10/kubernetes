#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-ex-05 --ignore-not-found --wait=true >/dev/null
kubectl delete pv cka-ex-05-pv --ignore-not-found >/dev/null
echo "Level 05 cleaned."
