#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-03
[[ "$(kubectl get svc api-svc -n "$NS" -o jsonpath='{.spec.selector.app}')" = backend ]]
[[ "$(kubectl get svc api-svc -n "$NS" -o jsonpath='{.spec.ports[0].targetPort}')" = 80 ]]
kubectl run probe -n "$NS" --rm -i --restart=Never --image=busybox:1.36 -- wget -q -T 5 -O - http://api-svc/ >/dev/null
echo "PASS: Service selector, target port and DNS routing work."
