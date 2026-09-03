# Lab 01 - Solution

## Goal
Inspect node state and ensure the pod is placed on a valid worker node.

## Step 1: Check cluster state

```bash
kubectl get nodes
kubectl get nodes -o wide
kubectl describe node <worker-node-name>
```

Look for:

- node role labels
- taints
- Ready status
- CPU and memory limits

## Step 2: Create namespace

```bash
kubectl create namespace cka-lab-01
```

## Step 3: Create deployment with node selector

```bash
cat <<'EOF' > /tmp/lab01-deploy.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-scheduler-demo
  namespace: cka-lab-01
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-scheduler-demo
  template:
    metadata:
      labels:
        app: nginx-scheduler-demo
    spec:
      nodeSelector:
        kubernetes.io/role: worker
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
EOF

kubectl apply -f /tmp/lab01-deploy.yaml
```

If the node role label differs in your cluster, inspect:

```bash
kubectl get nodes --show-labels
```

Then adapt the node selector to a valid worker label.

## Step 4: Validate

```bash
kubectl get pods -n cka-lab-01 -o wide
kubectl get deployment -n cka-lab-01
kubectl describe pod -n cka-lab-01 -l app=nginx-scheduler-demo
```

## Expected result

- Pod is scheduled to a worker node.
- Pod status becomes `Running`.
- Deployment is ready.
