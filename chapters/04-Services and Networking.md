# Services and Networking

## 1. Why networking matters in Kubernetes

Containers need a stable way to communicate with each other. Kubernetes adds networking layers for:

- pod-to-pod communication
- service-to-pod routing
- external access to applications
- DNS-based discovery

---

## 2. Services

A Service is an abstraction that exposes a set of Pods through a stable endpoint.

It gives you:

- a stable IP address
- a DNS name
- load balancing across Pods
- abstraction from pod IP changes

### Example

```bash
kubectl expose deployment nginx --port=80 --type=ClusterIP
kubectl get svc
kubectl describe svc nginx
```

### Types of Services

#### ClusterIP
- default service type
- reachable only inside the cluster

#### NodePort
- exposes an application on each node IP
- usually used for lab or simple access

#### LoadBalancer
- uses cloud load balancer integration
- common in cloud environments

#### ExternalName
- maps a service to an external DNS name

---

## 3. Selectors and labels

Services use labels and selectors to match Pods.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  selector:
    app: web
  ports:
  - port: 80
    targetPort: 80
```

A Pod with label `app: web` will match this Service.

---

## 4. DNS in Kubernetes

Each Service gets a DNS name in the cluster.

Example:

```bash
kubectl get svc
kubectl run test --rm -it --image=busybox --restart=Never -- nslookup web
```

This allows apps to reach other services using names rather than IPs.

---

## 5. Ingress

Ingress exposes HTTP and HTTPS routes from outside the cluster to Services.

It is often used instead of exposing many NodePorts.

### Ingress features

- path-based routing
- host-based routing
- TLS termination
- multi-service entrypoint

### Example

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example
spec:
  rules:
  - host: app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: web
            port:
              number: 80
```

Ingress requires an Ingress controller such as NGINX.

---

## 6. Network policies

Network policies control traffic between Pods.

They can allow or block ingress/egress rules based on labels and ports.

Example:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
```

This blocks all inbound traffic unless additional rules are added.

---

## 7. CoreDNS

CoreDNS provides service discovery in the cluster.

It resolves names such as:

- service-name
- service-name.namespace
- service-name.namespace.svc.cluster.local

If CoreDNS fails, many cluster features break.

```bash
kubectl get pods -n kube-system
kubectl logs -n kube-system deployment/coredns
```

---

## 8. Troubleshooting network issues

Common issues:

- Service has no endpoints
- Pods are not exposing target ports correctly
- Ingress controller is not installed
- DNS not resolving
- NetworkPolicy blocking traffic

Useful commands:

```bash
kubectl get svc
kubectl get endpoints
kubectl get pods -A
kubectl describe svc <service-name>
kubectl logs -n ingress-nginx deploy/ingress-nginx-controller
```

---

## 9. Practical lab ideas

### Lab 1: Expose a Deployment

```bash
kubectl create deployment web --image=nginx
kubectl expose deployment web --port=80 --target-port=80 --type=NodePort
kubectl get svc
```

### Lab 2: Test service communication

```bash
kubectl run curl --rm -it --image=curlimages/curl --restart=Never -- sh
```

Then inside the container:

```bash
curl http://web.default.svc.cluster.local
```

### Lab 3: Create a NetworkPolicy

Create a policy that allows traffic only from specific labels.

---

## 10. Quick revision notes

- Services provide stable access to Pods.
- Labels and selectors match Pods to Services.
- Ingress manages external HTTP/HTTPS routes.
- Network policies control Pod-to-Pod traffic.
- CoreDNS is the cluster DNS system.
- Service discovery is essential to cluster communication.

---

## 11. Sample questions

1. What is the purpose of a Service?
2. What is the difference between ClusterIP and NodePort?
3. Why is DNS important inside Kubernetes?
4. What does an Ingress controller do?
5. What is a NetworkPolicy used for?
6. How do labels and selectors relate to Services?
