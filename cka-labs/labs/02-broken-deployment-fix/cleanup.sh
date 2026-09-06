#!/usr/bin/env bash
set -euo pipefail
kubectl delete namespace cka-lab-02 --ignore-not-found --wait=true >/dev/null
echo "Lab 02 cleaned up."