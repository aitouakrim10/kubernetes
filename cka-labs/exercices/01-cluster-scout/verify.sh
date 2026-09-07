#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-01
NODE=$(kubectl get pod scout -n "$NS" -o jsonpath='{.spec.nodeName}')
[[ -n "$NODE" ]] && [[ "$(kubectl get pod scout -n "$NS" -o jsonpath='{.status.phase}')" = Running ]]
kubectl get node "$NODE" -l role=worker >/dev/null
echo "PASS: scout is Running on a worker node."
