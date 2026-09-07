# Solution

```bash
kubectl get pod incident -n cka-ex-08
kubectl describe pod incident -n cka-ex-08
kubectl logs pod/incident -n cka-ex-08 --previous
kubectl edit pod incident -n cka-ex-08
# Change the command to: ["sh", "-c", "echo booting; sleep 3600"]
./verify.sh
```

The container exits with status 1. `--previous` retrieves logs from the last terminated container instance.
