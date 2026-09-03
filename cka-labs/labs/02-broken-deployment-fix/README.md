# Lab 02 - Broken deployment fix

## Domain
Workloads and Scheduling

## Scenario
An application deployment has been rolled out with a broken container configuration. The deployment is not getting ready, and the cluster reports repeated restarts. Your task is to diagnose the problem and repair the deployment without deleting the workload history.

## Task

1. Inspect the deployment and its pods.
2. Identify why the application stays unhealthy.
3. Fix the configuration using a valid Kubernetes manifest.
4. Ensure the rollout recovers and the deployment becomes ready.
5. Check the replica count and pod status.

## Constraints

- Keep the deployment name the same.
- Preserve the namespace and app labels.
- Recovery should be done through the object definition, not by deleting the deployment and recreating it blindly.

## Expected outcome

- Deployment shows `READY` according to replicas.
- Pods are healthy and running.
- Rollout status completes successfully.

## Files

- solution.md
- verify.sh
