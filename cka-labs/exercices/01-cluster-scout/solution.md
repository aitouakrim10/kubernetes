# Solution

```bash
kubectl config current-context
kubectl get nodes --show-labels
kubectl get pod -n cka-ex-01 -o wide
kubectl describe pod scout -n cka-ex-01
kubectl patch pod scout -n cka-ex-01 --type merge -p '{"spec":{"nodeSelector":{"role":"worker"}}}'
```

Pods are not generally patchable for scheduling fields. If the patch is rejected, recreate the pod after changing `nodeSelector` with `kubectl edit pod scout -n cka-ex-01` or export, edit, delete and apply it. The root cause is a selector that matches no node.
