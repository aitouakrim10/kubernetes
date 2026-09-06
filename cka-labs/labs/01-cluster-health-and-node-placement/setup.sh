#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-01"
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')

[[ -n "$NODE" ]] || { echo "No Kubernetes node found." >&2; exit 1; }
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl label node "$NODE" cka-lab-worker=true --overwrite >/dev/null
kubectl create namespace "$NS" >/dev/null

kubectl apply -f - >/dev/null <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-scheduler-demo
  namespace: $NS
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-scheduler-demo
  template:
    metadata:
      labels:
        app: nginx-scheduler-demo
    spec:
      nodeSelector:
        cka-lab-worker: "false"
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
EOF

echo "Lab 01 ready. The workload should be Pending. Start with: kubectl get pods -n $NS -o wide"