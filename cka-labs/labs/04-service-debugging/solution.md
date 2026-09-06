# Lab 04 - Solution

## Diagnose

```bash
kubectl get pods -n cka-lab-04 --show-labels
kubectl describe svc -n cka-lab-04 app-svc
kubectl get endpoints -n cka-lab-04 app-svc
```

The Service selector does not match the pod label and its `targetPort` is not the port exposed by nginx.

## Fix

```bash
kubectl patch service app-svc -n cka-lab-04 --type='strategic' -p \
  '{"spec":{"selector":{"app":"backend-app"},"ports":[{"port":80,"targetPort":80}]}}'
```

## Validate

```bash
kubectl get endpoints -n cka-lab-04 app-svc
kubectl run testpod -n cka-lab-04 --rm -i --restart=Never --image=busybox:1.36 -- \
  wget -q -T 5 -O - http://app-svc/
./verify.sh
```