#!/usr/bin/env bash
set -euo pipefail
NODE=$(kubectl get nodes -l cka-lab-performance=true -o jsonpath='{.items[0].metadata.name}')
kubectl delete namespace cka-lab-03 --ignore-not-found --wait=true >/dev/null
if [[ -n "$NODE" ]]; then
  kubectl taint node "$NODE" cka-lab-performance=reserved:NoSchedule- >/dev/null 2>&1 || true
  kubectl label node "$NODE" cka-lab-performance- >/dev/null 2>&1 || true
fi
echo "Lab 03 cleaned up."