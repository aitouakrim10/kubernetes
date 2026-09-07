#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-ex-01 --ignore-not-found --wait=true >/dev/null
for node in $(kubectl get nodes -o name); do kubectl label "$node" role- >/dev/null 2>&1 || true; done
echo "Level 01 cleaned."
