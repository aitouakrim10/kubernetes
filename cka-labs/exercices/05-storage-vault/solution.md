# Solution

```bash
kubectl get pv,pvc -n cka-ex-05
kubectl describe pvc vault-claim -n cka-ex-05
kubectl get pod vault -n cka-ex-05 -o wide
./verify.sh
```

The intended fix is to make the PVC request match the provided PV, including `storageClassName: ""`, and mount the claim rather than using ephemeral storage. The setup already provides the correct PV; repair the PVC or pod if your cluster reports a mismatch.
