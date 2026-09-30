#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-02
kubectl rollout status deployment/web -n "$NS" --timeout=30s >/dev/null
[[ "$(kubectl get deploy web -n "$NS" -o jsonpath='{.spec.replicas}')" = 3 ]]
[[ "$(kubectl get deploy web -n "$NS" -o jsonpath='{.spec.template.spec.containers[0].image}')" = nginx:1.24 ]]
[[ "$(kubectl get deploy web -n "$NS" -o jsonpath='{.spec.template.spec.containers[0].readinessProbe.httpGet.path}')" = / ]]
echo "PASS: Deployment is healthy with the expected image, probe and replicas."
