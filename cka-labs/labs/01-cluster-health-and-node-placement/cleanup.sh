#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-01"
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
[[ -z "$NODE" ]] || kubectl label node "$NODE" cka-lab-worker- >/dev/null 2>&1 || true
echo "Lab 01 cleaned up."