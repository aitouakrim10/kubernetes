# Solution

Create a default deny and a narrow ingress allow:

```bash
kubectl apply -n cka-ex-07 -f - <<'EOF'
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: {name: default-deny}
spec: {podSelector: {}, policyTypes: [Ingress]}
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata: {name: allow-client-api}
spec:
  podSelector: {matchLabels: {app: api}}
  policyTypes: [Ingress]
  ingress: [{from: [{podSelector: {matchLabels: {role: client}}}], ports: [{protocol: TCP, port: 80}]}]
EOF
./verify.sh
```
