#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-02
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl apply -n "$NS" -f - >/dev/null <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 3
  selector:
    matchLabels: {app: web}
  template:
    metadata:
      labels: {app: web}
    spec:
      containers:
      - name: web
        image: nginx:1.14
        readinessProbe:
          httpGet: {path: /missing, port: 8080}
EOF
echo "Level 02 ready: kubectl rollout status deploy/web -n $NS"
