#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-lab-05 --ignore-not-found --wait=true >/dev/null
kubectl delete pv cka-lab-05-pv --ignore-not-found >/dev/null
NODE=$(kubectl get nodes -l cka-lab-storage=true -o jsonpath='{.items[0].metadata.name}')
[[ -z "$NODE" ]] || kubectl label node "$NODE" cka-lab-storage- >/dev/null 2>&1 || true
echo "Lab 05 cleaned up."