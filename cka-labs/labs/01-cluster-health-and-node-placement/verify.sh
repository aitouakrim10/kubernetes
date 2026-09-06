#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-01"
APP="nginx-scheduler-demo"

kubectl get ns "$NS" >/dev/null
kubectl get deploy -n "$NS" "$APP" >/dev/null
kubectl get pod -n "$NS" -l app="$APP" -o jsonpath='{.items[0].status.phase}' | grep -q "Running"
NODE_NAME=$(kubectl get pod -n "$NS" -l app="$APP" -o jsonpath='{.items[0].spec.nodeName}')
[[ -n "$NODE_NAME" ]]
LAB_LABEL=$(kubectl get node "$NODE_NAME" -o jsonpath='{.metadata.labels.cka-lab-worker}')
if [[ "$LAB_LABEL" != "true" ]]; then
  echo "Pod scheduled on a node without the lab worker label: $NODE_NAME"
  exit 1
fi

echo "Lab 01 verified: pod is scheduled on a worker node and running."
