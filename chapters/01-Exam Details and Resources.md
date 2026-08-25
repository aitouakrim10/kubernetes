# Exam Details and Resources

## 1. What is the CKA?

The Certified Kubernetes Administrator (CKA) exam tests whether you can administer a Kubernetes cluster in real scenarios. It is a performance-based exam, not only multiple choice.

The exam is designed to confirm that you can:

- install and configure a cluster
- manage workloads and scheduling
- work with services and networking
- handle storage and persistent data
- troubleshoot failures
- apply security and access control correctly

The focus is on practical command-line problem solving under time pressure.

---

## 2. Exam objectives

The CKA exam covers practical Kubernetes administration responsibilities including:

- Cluster architecture and installation
- Workloads and scheduling
- Services and networking
- Storage
- Troubleshooting
- RBAC and access control
- Kubernetes primitives and operations

You should be comfortable using `kubectl` directly and understanding how Kubernetes components work together.

---

## 3. Recommended study path

A strong exam strategy is:

1. Learn the concept
2. Practice on a cluster
3. Recreate tasks with `kubectl`
4. Time yourself on labs
5. Repeat until commands become automatic

The best way to pass is not memorization alone, but doing the work repeatedly.

---

## 4. Command-line tips and tricks

### Set namespace context

```bash
kubectl config set-context --current --namespace=kube-system
kubectl config view --minify
```

### Use aliases

```bash
alias k=kubectl
complete -o default -F __start_kubectl k
```

### Use kubectl auto-completion

```bash
source <(kubectl completion bash)
```

### Learn short names

Examples:

```bash
kubectl get po
kubectl get deploy
kubectl get svc
kubectl get ns
```

### Delete objects quickly

```bash
kubectl delete pod nginx
kubectl delete deployment nginx --force --grace-period=0
```

### Find object details

```bash
kubectl get pods -A
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

### Explore options

```bash
kubectl create deployment --help
kubectl expose --help
kubectl get pods --help
```

---

## 5. Exam environment tips

- Practice in a small local cluster such as Minikube or kubeadm
- Prefer YAML-based object creation
- Use short but clear commands
- Understand the difference between imperative and declarative setup
- Be comfortable reading pod and service output
- Learn how to debug with `describe`, `logs`, and `events`

---

## 6. Candidate skills

A successful CKA candidate should be able to:

- create and modify Kubernetes objects
- manage workloads and scaling
- troubleshoot failed pods and services
- inspect cluster health
- create configuration objects and services
- understand how networking and storage work within Kubernetes
- secure access with RBAC

---

## 7. Time management

The exam is time-sensitive. Good habits include:

- reading the task carefully
- finding the shortest path to the solution
- avoiding unnecessary object creation
- using filters and selectors efficiently
- validating with the smallest command that answers the question

---

## 8. Practice strategy

Use questions like these as a checklist:

- Can I deploy an app?
- Can I scale it?
- Can I expose it with a Service?
- Can I troubleshoot a broken pod?
- Can I inspect logs and events?
- Can I fix a failing Deployment?
- Can I create a PV, PVC, or StorageClass?
- Can I limit access with RBAC?

---

## 9. Summary

The CKA is a hands-on exam that rewards real Kubernetes administration skills. The goal is not to memorize random facts, but to learn how to operate a Kubernetes cluster from the command line under constraints.

To succeed, practice with live cluster tasks, understand the resource model, and become efficient with `kubectl`.

---

## 10. Quick review questions

1. What is the main purpose of the CKA exam?
2. What are the main CKA domains?
3. Why is kubectl command efficiency important?
4. Why is practice on a live cluster more valuable than theory alone?
5. What is the value of watching `describe` and `logs` output?
