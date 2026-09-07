#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-05
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl create namespace "$NS" >/dev/null
kubectl apply -f - >/dev/null <<EOF
apiVersion: v1
kind: PersistentVolume
metadata: {name: cka-ex-05-pv}
spec:
  capacity: {storage: 1Gi}
  accessModes: [ReadWriteOnce]
  persistentVolumeReclaimPolicy: Delete
  hostPath: {path: /tmp/cka-ex-05}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata: {name: vault-claim, namespace: $NS}
spec:
  accessModes: [ReadWriteOnce]
  resources: {requests: {storage: 1Gi}}
  storageClassName: ""
---
apiVersion: v1
kind: Pod
metadata: {name: vault, namespace: $NS}
spec:
  containers: [{name: vault, image: busybox:1.36, command: ["sh", "-c", "sleep 3600"], volumeMounts: [{name: data, mountPath: /data}]}]
  volumes: [{name: data, persistentVolumeClaim: {claimName: vault-claim}}]
EOF
echo "Level 05 ready: inspect pvc and pod events."
