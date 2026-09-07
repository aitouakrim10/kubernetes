#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-08
kubectl wait --for=condition=Ready pod/incident -n "$NS" --timeout=30s >/dev/null
[[ "$(kubectl get pod incident -n "$NS" -o jsonpath='{.status.phase}')" = Running ]]
echo "PASS: incident pod is healthy."
