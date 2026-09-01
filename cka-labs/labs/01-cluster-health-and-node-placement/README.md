# Lab 01 - Cluster health and node placement

## Domain
Cluster Architecture, Installation, and Configuration

## Scenario
A new application is being deployed in the `cka-lab-01` namespace. The pod remains Pending because the scheduler cannot place it correctly. You need to inspect the cluster state, identify the scheduling constraint, and fix the workload so it lands on a valid worker node.

## Task

1. Review the cluster and confirm node status.
2. Identify the labels or taints that affect pod placement.
3. Create the namespace `cka-lab-01`.
4. Deploy a workload that must run on a worker node.
5. Confirm the pod reaches `Running` and is scheduled on the expected node.

## Constraints

- The workload must not be scheduled to the control-plane node.
- Use labels and a valid worker selection strategy.
- Do not modify the cluster globally unless absolutely necessary.

## Expected outcome

- Namespace exists.
- Pod is scheduled and is `Running`.
- Node selector or affinity is valid.

## Files

- solution.md
- verify.sh
