#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-04"
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null

kubectl apply -f - >/dev/null <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-app
  namespace: $NS
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend-app
  template:
    metadata:
      labels:
        app: backend-app
    spec:
      containers:
      - name: backend
        image: nginx:1.25
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: app-svc
  namespace: $NS
spec:
  selector:
    app: wrong-backend-label
  ports:
  - port: 80
    targetPort: 8080
EOF

echo "Lab 04 ready. The Service has no usable endpoint. Start with: kubectl describe svc -n $NS app-svc"