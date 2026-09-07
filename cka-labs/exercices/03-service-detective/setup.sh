#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-03
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl apply -n "$NS" -f - >/dev/null <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata: {name: api}
spec:
  replicas: 2
  selector: {matchLabels: {app: backend}}
  template:
    metadata: {labels: {app: backend}}
    spec:
      containers: [{name: api, image: nginx:1.25, ports: [{containerPort: 80}]}]
---
apiVersion: v1
kind: Service
metadata: {name: api-svc}
spec:
  selector: {app: api}
  ports: [{port: 80, targetPort: 8080}]
EOF
echo "Level 03 ready: inspect kubectl get svc,endpointslice,pods -n $NS"
