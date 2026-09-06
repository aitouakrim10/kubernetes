# Lab 02 - Broken deployment fix

## Domain
Workloads and Scheduling

## Scenario
The setup script has created a deployment with a broken readiness configuration. The deployment is not getting ready. Diagnose and repair it without deleting the deployment.

## Task

1. Inspect the deployment, pod events, and container configuration.
2. Identify why the application stays unhealthy.
3. Fix the deployment in place using a valid manifest or `kubectl edit`.
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

## Start and reset

```bash
./setup.sh
```

After solving the task, run `./verify.sh`. Use `./cleanup.sh` to reset the lab.

## Files

- solution.md
- verify.sh
