#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-lab-04 --ignore-not-found --wait=true >/dev/null
echo "Lab 04 cleaned up."