# Solution

```bash
kubectl create configmap app-config -n cka-ex-04 --from-literal=APP_MODE=production --dry-run=client -o yaml | kubectl apply -f -
kubectl create secret generic app-secret -n cka-ex-04 --from-literal=API_TOKEN=change-me --dry-run=client -o yaml | kubectl apply -f -
kubectl edit pod config-checker -n cka-ex-04
# Keep envFrom and the volume; correct the two data objects.
./verify.sh
```
