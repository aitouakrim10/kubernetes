# Lab 03 - Solution

## Diagnose

```bash
kubectl get nodes --show-labels
kubectl describe pod -n cka-lab-03 -l app=perf-worker-app
```

The selected node has the taint `cka-lab-performance=reserved:NoSchedule`. The workload also needs required affinity for `cka-lab-performance=true`.

## Fix

```bash
kubectl patch deployment perf-worker-app -n cka-lab-03 --type='strategic' -p \
  '{"spec":{"template":{"spec":{"tolerations":[{"key":"cka-lab-performance","operator":"Equal","value":"reserved","effect":"NoSchedule"}],"affinity":{"nodeAffinity":{"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"cka-lab-performance","operator":"In","values":["true"]}]}]}}}}}}}'
kubectl rollout status deployment/perf-worker-app -n cka-lab-03
```

## Validate

```bash
kubectl get pod -n cka-lab-03 -o wide
./verify.sh
```