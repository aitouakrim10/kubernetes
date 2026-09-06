#!/usr/bin/env bash
set -euo pipefail

NS="cka-lab-04"
SVC="app-svc"

kubectl get ns "$NS" >/dev/null
kubectl get svc -n "$NS" "$SVC" >/dev/null
ENDPOINTS=$(kubectl get endpoints -n "$NS" "$SVC" -o jsonpath='{.subsets[0].addresses[0].ip}')
[[ -n "$ENDPOINTS" ]]

kubectl run testpod -n "$NS" --rm -i --image=busybox:1.36 --restart=Never -- wget -q -T 5 -O - http://app-svc/ >/dev/null

echo "Lab 04 verified: service has healthy endpoints and responds to traffic."
