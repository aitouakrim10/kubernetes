#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-04
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl create configmap app-config -n "$NS" --from-literal=APP_MODE=wrong >/dev/null
kubectl create secret generic app-secret -n "$NS" --from-literal=API_TOKEN=wrong >/dev/null
kubectl apply -n "$NS" -f - >/dev/null <<'EOF'
apiVersion: v1
kind: Pod
metadata: {name: config-checker}
spec:
  containers:
  - name: checker
    image: busybox:1.36
    command: ["sh", "-c", "sleep 3600"]
    envFrom: [{configMapRef: {name: app-config}}]
    volumeMounts: [{name: secret, mountPath: /etc/app/token}]
  volumes: [{name: secret, secret: {secretName: app-secret}}]
EOF
echo "Level 04 ready."
