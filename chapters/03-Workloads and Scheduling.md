# Workloads and Scheduling

## 1. Workloads in Kubernetes

A workload is the set of containers and resources that run an application in Kubernetes.

Common workload types:

- Deployments
- StatefulSets
- DaemonSets
- Jobs
- CronJobs
- ReplicaSets
- Pods

The main idea is to manage application lifecycle, scaling, rollouts, and restarts.

---

## 2. Deployments

A Deployment manages ReplicaSets and ensures the desired number of Pods is running.

### Why use Deployments?

- declarative updates
- rolling updates
- rollback support
- scaling of replicas
- self-healing behavior

### Create a Deployment

```bash
kubectl create deployment nginx --image=nginx
kubectl get deploy
kubectl get pods
```

### Scale a Deployment

```bash
kubectl scale deployment nginx --replicas=3
kubectl get pods -w
```

### Update a Deployment

```bash
kubectl set image deployment/nginx nginx=nginx:1.23
kubectl rollout status deployment/nginx
```

### Rollback a Deployment

```bash
kubectl rollout undo deployment/nginx
kubectl rollout history deployment/nginx
```

---

## 3. ReplicaSets

ReplicaSets ensure a desired number of Pod replicas are running.

They are usually created by a Deployment, but you may also manage them directly.

```bash
kubectl get rs
kubectl describe rs <replicaset-name>
```

ReplicaSets maintain the target count and replace pods that are deleted or fail.

---

## 4. StatefulSets

StatefulSets are used for workloads that require stable identities and persistent storage.

Typical use cases:

- databases
- distributed systems
- stateful application services

Key features:

- stable network names
- ordered deployment and scaling
- persistent storage per replica

```bash
kubectl get statefulset
kubectl describe statefulset <name>
```

---

## 5. DaemonSets

A DaemonSet ensures that one copy of a Pod runs on each node or selected subset of nodes.

Typical examples:

- log collectors
- monitoring agents
- networking daemons

```bash
kubectl get daemonsets -A
```

---

## 6. Jobs and CronJobs

### Jobs

A Job creates Pods that run to completion once.

```bash
kubectl create job hello-job --image=busybox -- echo hello
kubectl get jobs
kubectl describe job hello-job
```

### CronJobs

A CronJob schedules Jobs on a time-based schedule.

```bash
kubectl create cronjob hello-cron --schedule="*/5 * * * *" --image=busybox -- /bin/sh -c 'echo hello'
kubectl get cronjobs
```

---

## 7. Scheduling concepts

The scheduler decides where a pod should run.

It evaluates:

- available node resources
- taints and tolerations
- node affinity
- pod affinity/anti-affinity
- labels and selectors

### Node selector

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeSelector:
    disktype: ssd
  containers:
  - name: nginx
    image: nginx
```

---

## 8. Taints and tolerations

Taints are applied to nodes. Tolerations are applied to pods.

A pod with a toleration can schedule onto a tainted node.

```bash
kubectl taint nodes worker1 key=value:NoSchedule
kubectl describe node worker1
```

Typical reasons for taints:

- dedicated nodes
- special workloads
- hardware isolation

---

## 9. Affinity and anti-affinity

### Node affinity

Node affinity is a more expressive way to constrain where Pods run.

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: disktype
          operator: In
          values:
          - ssd
```

### Pod affinity / anti-affinity

This helps place Pods close to each other or away from each other.

```yaml
affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
    - labelSelector:
        matchLabels:
          app: web
      topologyKey: kubernetes.io/hostname
```

---

## 10. Horizontal Pod Autoscaler (HPA)

HPA automatically scales workloads based on CPU, memory, or custom metrics.

### Example

```bash
kubectl autoscale deployment nginx --cpu-percent=50 --min=1 --max=10
kubectl get hpa
kubectl describe hpa nginx
```

HPA works through the metrics server or custom metrics adapters.

---

## 11. Troubleshooting workloads

Common workload problems include:

- Pods stuck in Pending
- CrashLoopBackOff
- ImagePullBackOff
- failed readiness or liveness probes
- insufficient resources

Check with:

```bash
kubectl get pods -A
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

---

## 12. Practical lab ideas

### Lab 1: Create a Deployment

```bash
kubectl create deployment demo --image=nginx
kubectl get deploy,pods
```

### Lab 2: Scale it

```bash
kubectl scale deployment demo --replicas=4
kubectl get pods
```

### Lab 3: Rollout update

```bash
kubectl set image deployment/demo nginx=nginx:1.25
kubectl rollout status deployment/demo
```

### Lab 4: Rollback

```bash
kubectl rollout undo deployment/demo
```

---

## 13. Quick revision notes

- Deployments are the most common workload controller.
- ReplicaSets ensure the desired replica count.
- StatefulSets are suitable for stateful services.
- Jobs run once to completion.
- CronJobs schedule repeatable jobs.
- Scheduling uses resource, affinity, and taint logic.
- HPA scales applications automatically.

---

## 14. Sample exam-style questions

1. What is the difference between a Deployment and a StatefulSet?
2. Why would you use a DaemonSet?
3. What does the scheduler consider while placing Pods?
4. What is the role of a taint?
5. How do you create an HPA for a Deployment?
6. What command shows the rollout history of a Deployment?
7. What is the difference between a Job and a CronJob?
