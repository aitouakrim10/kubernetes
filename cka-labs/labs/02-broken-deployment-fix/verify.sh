#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-02"
DEPLOY="broken-demo"

kubectl get ns "$NS" >/dev/null
kubectl rollout status deployment/$DEPLOY -n "$NS" --timeout=120s
kubectl get pods -n "$NS" -l app="$DEPLOY" -o jsonpath='{.items[0].status.phase}' | grep -q "Running"
READY=$(kubectl get deploy -n "$NS" "$DEPLOY" -o jsonpath='{.status.readyReplicas}')
[[ "$READY" == "2" ]]

echo "Lab 02 verified: deployment recovered and is ready."
