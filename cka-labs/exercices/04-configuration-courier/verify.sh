#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-04
kubectl wait --for=condition=Ready pod/config-checker -n "$NS" --timeout=30s >/dev/null
[[ "$(kubectl exec -n "$NS" config-checker -- printenv APP_MODE)" = production ]]
[[ "$(kubectl exec -n "$NS" config-checker -- cat /etc/app/token/API_TOKEN)" = change-me ]]
echo "PASS: ConfigMap and Secret are injected correctly."
