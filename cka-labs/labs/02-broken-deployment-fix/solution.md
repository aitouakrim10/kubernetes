# Lab 02 - Solution

## Goal
Diagnose and repair a deployment that is failing readiness due to a broken container configuration.

The setup script already created `cka-lab-02/broken-demo` with two replicas. Do not delete the deployment.

## Step 1: Inspect deployment and pod events

```bash
kubectl get deploy -n cka-lab-02
kubectl get pods -n cka-lab-02 -o wide
kubectl describe deploy -n cka-lab-02
kubectl describe pod -n cka-lab-02 -l app=broken-demo
```

Common issue in this lab:

- wrong container port
- invalid command or image tag
- readiness probe failing

## Step 2: Fix the deployment manifest

Correct the probe path in place. For example:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: broken-demo
  namespace: cka-lab-02
spec:
  replicas: 2
  selector:
    matchLabels:
      app: broken-demo
  template:
    metadata:
      labels:
        app: broken-demo
    spec:
      containers:
      - name: app
        image: nginx:1.25
        ports:
        - containerPort: 80
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 1
          periodSeconds: 3
```

```bash
kubectl apply -f /tmp/lab02-fix.yaml
```

## Step 3: Confirm rollout recovery

```bash
kubectl rollout status deployment/broken-demo -n cka-lab-02
kubectl get pods -n cka-lab-02
kubectl get deployment -n cka-lab-02
```

## Expected result

- Deployment reaches READY/AVAILABLE state.
- Pods are `Running` and ready.
- No crash loop or repeated restarts remain.
