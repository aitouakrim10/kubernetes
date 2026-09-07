#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-08
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl apply -n "$NS" -f - >/dev/null <<'EOF'
apiVersion: v1
kind: Pod
metadata: {name: incident}
spec:
  containers:
  - name: app
    image: busybox:1.36
    command: ["sh", "-c", "echo booting; exit 1"]
EOF
echo "Level 08 ready: investigate logs, describe and events."
