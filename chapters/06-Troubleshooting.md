# Troubleshooting

## 1. Troubleshooting mindset

In Kubernetes, most problems can be isolated by checking the resource state, logs, events, and configuration. The most useful commands are usually:

```bash
kubectl get pods -A
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace>
kubectl get events -A
```

---

## 2. Common failure patterns

### Pods stay Pending

Possible reasons:

- no node available
- insufficient CPU or memory
- scheduler constraints
- container runtime issue
- network plugin not ready

Check:

```bash
kubectl get pods -A
kubectl describe pod <pod-name>
```

### Pods are CrashLoopBackOff

This often means the app starts but exits immediately or fails readiness checks.

Check:

```bash
kubectl logs <pod-name>
kubectl describe pod <pod-name>
```

### ImagePullBackOff

The pod cannot pull the image.

Check:

- correct image name
- credentials and registry access
- image tag existence

```bash
kubectl describe pod <pod-name>
```

### Service not reachable

Possible reasons:

- wrong selector
- no backend endpoints
- target port mismatch
- network policy restriction

Check:

```bash
kubectl get svc
kubectl get endpoints
kubectl describe svc <svc-name>
```

---

## 3. Inspecting cluster state

```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc -A
kubectl get ns
kubectl cluster-info
```

This gives the high-level health picture before drilling into one resource.

---

## 4. Looking at events

Events are often the fastest way to identify the root cause.

```bash
kubectl get events -A
kubectl describe node <node-name>
```

Events often reveal:

- FailedScheduling
- FailedMount
- BackOff
- Unhealthy
- ImagePullError

---

## 5. Debugging control plane issues

If the control plane is affected, look at:

```bash
kubectl get pods -n kube-system
kubectl logs -n kube-system deploy/kube-apiserver
kubectl logs -n kube-system deploy/kube-scheduler
```

Common control-plane symptoms include:

- API server unavailable
- node registration issues
- etcd problems
- scheduler unable to place pods

---

## 6. Debugging worker node issues

```bash
sudo systemctl status kubelet
sudo journalctl -u kubelet -n 100 --no-pager
kubectl describe node <node-name>
```

Check for:

- not-ready node
- runtime not available
- disk pressure
- memory pressure
- network issues

---

## 7. CoreDNS and DNS failures

If DNS is broken, Pods may fail to resolve service names.

```bash
kubectl get pods -n kube-system | grep coredns
kubectl logs -n kube-system deployment/coredns
```

---

## 8. Troubleshooting storage

Storage issues may show as:

- PVC Pending
- Pod stuck waiting for volume
- mount failures

```bash
kubectl get pvc
kubectl get pv
kubectl describe pvc <pvc-name>
kubectl describe pod <pod-name>
```

---

## 9. Troubleshooting strategy

Use this order:

1. Check cluster and pod state
2. Check events
3. Check logs
4. Check node health
5. Check networking and storage dependencies
6. Fix the smallest root cause
7. Validate the fix

---

## 10. Practical lab ideas

### Lab 1: Check a failing pod

```bash
kubectl create deployment broken --image=nginx:badtag
kubectl get pods
kubectl describe pod <pod-name>
```

### Lab 2: Inspect a service mismatch

```bash
kubectl expose deployment broken --port=80
kubectl get svc
kubectl describe svc <service-name>
```

### Lab 3: Fix node issues

```bash
kubectl get nodes
kubectl describe node <node-name>
```

---

## 11. Quick revision notes

- `describe` and `logs` are your first debugging tools.
- `kubectl get events -A` is often extremely valuable.
- Pending Pods usually relate to scheduling or resource shortages.
- CrashLoopBackOff usually means the app exits immediately.
- Service issues usually involve selectors, ports, or endpoints.
- Node failures often point to kubelet or runtime problems.

---

## 12. Sample exam questions

1. What command helps diagnose a Pod in Pending state?
2. Why is `kubectl describe` useful during troubleshooting?
3. What does `ImagePullBackOff` usually indicate?
4. What are the first checks for a failing Service?
5. How do you inspect CoreDNS health?
6. What is the relationship between node issues and kubelet logs?
