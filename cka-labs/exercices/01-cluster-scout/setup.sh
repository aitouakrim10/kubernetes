#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-01
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl label node "$NODE" role=worker --overwrite >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl apply -n "$NS" -f - >/dev/null <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: scout
spec:
  nodeSelector:
    role: missing
  containers:
  - name: scout
    image: nginx:1.25
EOF
echo "Level 01 ready: kubectl get pod -n $NS -o wide"
