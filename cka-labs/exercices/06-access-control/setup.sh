#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-06
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl create serviceaccount auditor -n "$NS" >/dev/null
echo "Level 06 ready: create Role and RoleBinding."
