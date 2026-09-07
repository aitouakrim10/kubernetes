# Level 12 - CKA Boss Fight

Set a 45-minute timer. A namespace contains a broken Deployment, Service, ConfigMap, PVC and RBAC policy. Restore the application and prove:

- rollout is available
- Service has endpoints and DNS works
- configuration is injected
- PVC is Bound and mounted
- the ServiceAccount can read pods but cannot delete them

Use only the Kubernetes API and `kubectl`. Write a short root-cause report after `./verify.sh` passes. This is the cumulative mission; use the earlier levels as your reference, not `solution.md`.
