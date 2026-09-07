#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-05
kubectl wait --for=condition=Ready pod/vault -n "$NS" --timeout=30s >/dev/null
[[ "$(kubectl get pvc vault-claim -n "$NS" -o jsonpath='{.status.phase}')" = Bound ]]
kubectl exec -n "$NS" vault -- sh -c 'echo durable > /data/proof.txt'
kubectl delete pod vault -n "$NS" --wait=true >/dev/null
kubectl wait --for=condition=Ready pod/vault -n "$NS" --timeout=30s >/dev/null
[[ "$(kubectl exec -n "$NS" vault -- cat /data/proof.txt)" = durable ]]
echo "PASS: PVC is bound and data survives pod recreation."
