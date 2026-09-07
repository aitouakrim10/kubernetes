#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-07
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl apply -n "$NS" -f - >/dev/null <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata: {name: api}
spec:
  replicas: 1
  selector: {matchLabels: {app: api}}
  template:
    metadata: {labels: {app: api}}
    spec: {containers: [{name: api, image: nginx:1.25}]}
---
apiVersion: v1
kind: Service
metadata: {name: api}
spec: {selector: {app: api}, ports: [{port: 80}]}
---
apiVersion: v1
kind: Pod
metadata: {name: client, labels: {role: client}}
spec: {containers: [{name: client, image: busybox:1.36, command: ["sh", "-c", "sleep 3600"]}]}
---
apiVersion: v1
kind: Pod
metadata: {name: blocked, labels: {role: blocked}}
spec: {containers: [{name: blocked, image: busybox:1.36, command: ["sh", "-c", "sleep 3600"]}]}
EOF
echo "Level 07 ready."
