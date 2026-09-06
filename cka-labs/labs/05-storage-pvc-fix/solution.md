# Lab 05 - Solution

## Diagnose

```bash
kubectl get pv,pvc -n cka-lab-05
kubectl describe pvc -n cka-lab-05 app-data
kubectl describe pod -n cka-lab-05 storage-app
```

The PV uses `cka-lab-05-static`, while the claim requests the deliberately incorrect class `cka-lab-05-wrong`.

## Fix

A PVC's storage class cannot be changed after creation. Delete only the unbound claim, then recreate it with the PV's class:

```bash
cat <<'EOF' > /tmp/lab05-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-data
  namespace: cka-lab-05
spec:
  accessModes:
  - ReadWriteOnce
  storageClassName: cka-lab-05-static
  resources:
    requests:
      storage: 1Gi
EOF

kubectl delete pvc app-data -n cka-lab-05
kubectl apply -f /tmp/lab05-pvc.yaml
kubectl wait --for=jsonpath='{.status.phase}'=Bound pvc/app-data -n cka-lab-05 --timeout=60s
```

## Validate

```bash
kubectl get pvc,pod -n cka-lab-05
./verify.sh
```