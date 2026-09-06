#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-02"
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null

kubectl apply -f - >/dev/null <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: broken-demo
  namespace: $NS
spec:
  replicas: 2
  selector:
    matchLabels:
      app: broken-demo
  template:
    metadata:
      labels:
        app: broken-demo
    spec:
      containers:
      - name: app
        image: nginx:1.25
        ports:
        - containerPort: 80
        readinessProbe:
          httpGet:
            path: /does-not-exist
            port: 80
          initialDelaySeconds: 1
          periodSeconds: 3
EOF

echo "Lab 02 ready. The deployment is not ready. Start with: kubectl describe pod -n $NS"