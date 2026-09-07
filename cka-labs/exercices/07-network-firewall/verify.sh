#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-07
kubectl wait --for=condition=Ready pod/client -n "$NS" --timeout=30s >/dev/null
kubectl wait --for=condition=Ready pod/blocked -n "$NS" --timeout=30s >/dev/null
kubectl get networkpolicy default-deny -n "$NS" >/dev/null
kubectl get networkpolicy allow-client-api -n "$NS" >/dev/null
kubectl exec -n "$NS" client -- wget -q -T 5 -O - http://api/ >/dev/null
echo "PASS: NetworkPolicy objects exist and client can reach api."
