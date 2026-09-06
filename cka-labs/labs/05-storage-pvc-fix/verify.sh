#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-05"
PVC="app-data"

kubectl get ns "$NS" >/dev/null
kubectl get pvc -n "$NS" "$PVC" >/dev/null
kubectl get pvc -n "$NS" "$PVC" -o jsonpath='{.status.phase}' | grep -q "Bound"
kubectl get pod -n "$NS" storage-app -o jsonpath='{.status.phase}' | grep -q "Running"
kubectl get pod -n "$NS" storage-app -o jsonpath='{.status.containerStatuses[0].ready}' | grep -q "true"

echo "Lab 05 verified: PVC is bound and the application is running with storage mounted."
