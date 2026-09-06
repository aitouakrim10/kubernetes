# Lab 01 - Solution

The setup script already created the namespace and deployment. Do not recreate them.

## Diagnose

```bash
kubectl get nodes --show-labels
kubectl get pods -n cka-lab-01 -o wide
kubectl describe pod -n cka-lab-01 -l app=nginx-scheduler-demo
```

The deployment selects `cka-lab-worker: "false"`, while setup labeled one node `cka-lab-worker: "true"`.

## Fix

```bash
kubectl patch deployment nginx-scheduler-demo -n cka-lab-01 --type='strategic' \
  -p '{"spec":{"template":{"spec":{"nodeSelector":{"cka-lab-worker":"true"}}}}}'
kubectl rollout status deployment/nginx-scheduler-demo -n cka-lab-01
```

## Validate

```bash
kubectl get deployment,pod -n cka-lab-01 -o wide
./verify.sh
```