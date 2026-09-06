#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-03"
APP="perf-worker-app"

kubectl get ns "$NS" >/dev/null
kubectl get deployment -n "$NS" "$APP" >/dev/null
kubectl get pod -n "$NS" -l app="$APP" -o jsonpath='{.items[0].status.phase}' | grep -q "Running"
NODE_NAME=$(kubectl get pod -n "$NS" -l app="$APP" -o jsonpath='{.items[0].spec.nodeName}')
[[ -n "$NODE_NAME" ]]
kubectl get node "$NODE_NAME" -o jsonpath='{.metadata.labels.cka-lab-performance}' | grep -q "true"
kubectl get pod -n "$NS" -l app="$APP" -o jsonpath='{.items[0].spec.tolerations[0].key}' | grep -q "cka-lab-performance"

echo "Lab 03 verified: workload is scheduled according to affinity and toleration rules."
