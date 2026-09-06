# Lab 01 - Cluster health and node placement

## Domain
Cluster Architecture, Installation, and Configuration

## Scenario
The setup script has created a namespace and a deployment whose pod cannot be scheduled. Inspect the cluster and fix the workload so it lands on the lab worker node.

## Task

1. Review the cluster and confirm node status.
2. Identify why `nginx-scheduler-demo` is Pending.
3. Correct the deployment's scheduling rule without changing the node label.
4. Confirm the pod reaches `Running` and is scheduled on the lab worker node.

## Constraints

- The workload must not be scheduled to the control-plane node.
- Use labels and a valid worker selection strategy.
- Do not modify the cluster globally unless absolutely necessary.

## Expected outcome

- Namespace exists.
- Pod is scheduled and is `Running`.
- Node selector or affinity is valid.

## Start and reset

```bash
./setup.sh
```

After solving the task, run `./verify.sh`. Use `./cleanup.sh` to reset the lab.

## Files

- solution.md
- verify.sh
