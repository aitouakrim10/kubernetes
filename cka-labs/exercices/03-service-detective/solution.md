# Solution

```bash
kubectl get pods -n cka-ex-03 --show-labels
kubectl get svc,endpointSlice -n cka-ex-03
kubectl patch service api-svc -n cka-ex-03 --type merge -p '{"spec":{"selector":{"app":"backend"},"ports":[{"port":80,"targetPort":80}]}}'
./verify.sh
```

The Service selected `app=api`, while pods had `app=backend`; its target port also did not match nginx.
