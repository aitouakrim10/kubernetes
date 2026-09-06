#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-03"
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
[[ -n "$NODE" ]] || { echo "No Kubernetes node found." >&2; exit 1; }
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl label node "$NODE" cka-lab-performance=true --overwrite >/dev/null
kubectl taint node "$NODE" cka-lab-performance=reserved:NoSchedule --overwrite >/dev/null
kubectl create namespace "$NS" >/dev/null

kubectl apply -f - >/dev/null <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: perf-worker-app
  namespace: $NS
spec:
  replicas: 1
  selector:
    matchLabels:
      app: perf-worker-app
  template:
    metadata:
      labels:
        app: perf-worker-app
    spec:
      nodeSelector:
        cka-lab-performance: "true"
      containers:
      - name: app
        image: nginx:1.25
EOF

echo "Lab 03 ready. The workload is blocked by a taint. Start with: kubectl describe pod -n $NS"