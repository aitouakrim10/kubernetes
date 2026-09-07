#!/usr/bin/env bash
set -euo pipefail
NS=cka-ex-06
[[ "$(kubectl auth can-i list pods --as=system:serviceaccount:$NS:auditor -n "$NS")" = yes ]]
[[ "$(kubectl auth can-i delete pods --as=system:serviceaccount:$NS:auditor -n "$NS")" = no ]]
echo "PASS: auditor has read-only pod access."
