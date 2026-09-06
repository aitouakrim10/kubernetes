# Lab 03 - Scheduling with taints, tolerations, and affinity

## Domain
Workloads and Scheduling

## Scenario
The setup script labels one node as the performance node, applies a dedicated taint, and creates a deployment with incomplete scheduling rules. The workload must run there and nowhere else.

## Task

1. Inspect the node labels and taints.
2. Inspect the Pending workload created by setup.
3. Use node affinity and tolerations to schedule the pod on the correct node class.
4. Validate successful scheduling.

## Constraints

- The pod must not land on unrelated nodes.
- It must tolerate the workload-specific taint.
- Use declarative scheduling rules rather than ad hoc manual scheduling.

## Expected outcome

- Pod runs on the designated performance node.
- Toleration and affinity rules are respected.
- No scheduling conflict remains.

## Start and reset

```bash
./setup.sh
```

After solving the task, run `./verify.sh`. Use `./cleanup.sh` to reset the lab. The setup needs permission to label and taint one node.

## Files

- solution.md
- verify.sh
