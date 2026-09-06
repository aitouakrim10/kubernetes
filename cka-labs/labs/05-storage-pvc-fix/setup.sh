#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-05"
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
[[ -n "$NODE" ]] || { echo "No Kubernetes node found." >&2; exit 1; }
kubectl cluster-info >/dev/null
kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null
kubectl delete pv cka-lab-05-pv --ignore-not-found >/dev/null
kubectl label node "$NODE" cka-lab-storage=true --overwrite >/dev/null
kubectl create namespace "$NS" >/dev/null

kubectl apply -f - >/dev/null <<EOF
apiVersion: v1
kind: PersistentVolume
metadata:
  name: cka-lab-05-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  storageClassName: cka-lab-05-static
  hostPath:
    path: /tmp/cka-lab-05-data
    type: DirectoryOrCreate
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: cka-lab-storage
          operator: In
          values: ["true"]
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-data
  namespace: $NS
spec:
  accessModes: [ReadWriteOnce]
  storageClassName: cka-lab-05-wrong
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: storage-app
  namespace: $NS
spec:
  containers:
  - name: app
    image: nginx:1.25
    volumeMounts:
    - name: data
      mountPath: /usr/share/nginx/html/data
  volumes:
  - name: data
    persistentVolumeClaim:
      claimName: app-data
EOF

echo "Lab 05 ready. The PVC cannot bind. Start with: kubectl describe pvc -n $NS app-data"